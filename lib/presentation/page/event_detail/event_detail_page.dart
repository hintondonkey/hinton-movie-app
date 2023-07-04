import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/resources/index.dart';
import 'package:movie_app/presentation/styles/index.dart';
import 'package:movie_app/presentation/utils/index.dart';
import 'package:movie_app/presentation/widgets/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:readmore/readmore.dart';

import 'index.dart';

class EventDetailPage extends BasePage {
  const EventDetailPage({
    required PageTag pageTag,
    Key? key,
    required this.eventId,
  }) : super(tag: pageTag, key: key);
  final int eventId;

  @override
  State<StatefulWidget> createState() => EventDetailPageState();
}

class EventDetailPageState
    extends BasePageState<EventDetailBloc, EventDetailPage, EventDetailRouter> {
  StreamSubscription? _subscription;
  final RefreshController _refreshController = RefreshController();

  @override
  void stateListenerHandler(BaseState state) async {
    super.stateListenerHandler(state);
  }

  @override
  void initState() {
    super.initState();
    bloc.dispatchEvent(FetchStreamByIdEvent(
        param: FetchStreamByIdParam(
      streamId: widget.eventId,
    )));
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
    _refreshController.dispose();
  }

  void _onRefresh() {
    bloc.dispatchEvent(FetchStreamByIdEvent(
        param: FetchStreamByIdParam(
      streamId: widget.eventId,
    )));
    _refreshController.refreshCompleted();
  }

  @override
  Widget buildLayout(BuildContext context, BaseBloc bloc) {
    return BlocBuilder<EventDetailBloc, EventDetailState>(
        builder: (ctx, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFF3F3F3),
          appBar: const HintonAppBar(
            bgrColor: Color(0xFFF3F3F3),
          ),
          body: Center(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: state.loadingStatus != LoadingStatus.loading,
              onRefresh: _onRefresh,
              child: state.loadingStatus == LoadingStatus.loading
                  ? const Center(
                      child: ShimmerItemWidget(),
                    )
                  : _buildBody(state: state),
            ),
          ),
        ),
      );
    });
  }

  _buildBody({required EventDetailState state}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            _BuildSlideView(
                isHorizontal: state.streamModel?.isHorizontal ?? false,
                urls: state.streamModel?.streamPlatformImage
                        ?.map((e) => e.name ?? '')
                        .toList() ??
                    []),
            const SizedBox(
              height: 34,
            ),
            _BuildContentView(content: state.streamModel?.description ?? ''),
            const SizedBox(
              height: 32,
            ),
            state.streamModel?.subIcon != null &&
                    state.streamModel?.subIcon?.trim().isNotEmpty == true
                ? _BuildSubIconWidget(
                    subIcons: [state.streamModel?.subIcon ?? ''])
                : const SizedBox(),
            Visibility(
              visible: state.streamModel?.subIcon != null &&
                  state.streamModel?.subIcon?.trim().isNotEmpty == true,
              child: const SizedBox(
                height: 32,
              ),
            ),
            state.streamModel?.watchlist?.isNotEmpty == true
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, idx) {
                      return _BuildWatchlistItem(
                        watchModel: state.streamModel!.watchlist![idx],
                      );
                    },
                    separatorBuilder: (ctx, idx) {
                      return const SizedBox(
                        height: 26,
                      );
                    },
                    itemCount: state.streamModel?.watchlist?.length ?? 0)
                : const SizedBox(),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildSlideView extends StatefulWidget {
  const _BuildSlideView({
    Key? key,
    required this.urls,
    required this.isHorizontal,
  }) : super(key: key);
  final List<String> urls;
  final bool isHorizontal;

  @override
  State<_BuildSlideView> createState() => _BuildSlideViewState();
}

class _BuildSlideViewState extends State<_BuildSlideView> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.urls.length,
      options: CarouselOptions(
        autoPlay: false,
        height: widget.isHorizontal ? 424 : 158,
        aspectRatio: widget.isHorizontal ? 9 / 16 : 16 / 9,
        onPageChanged: (index, reason) {},
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: widget.urls[index],
              placeholder: (context, url) => const ImageErrorView(),
              errorWidget: (context, url, error) => const ImageErrorView(),
            ),
          ),
        );
      },
    );
  }
}

class _BuildContentView extends StatelessWidget {
  const _BuildContentView({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      content,
      trimLines: 5,
      style: titleMedium.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.textColorMain),
      trimMode: TrimMode.Line,
      trimCollapsedText: AppLocalizations.shared.commonSeeMore,
      trimExpandedText: AppLocalizations.shared.commonSeeLess,
      delimiter: '...',
      lessStyle: titleMedium.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      moreStyle: titleMedium.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _BuildWatchlistItem extends StatelessWidget with BasePageMixin {
  const _BuildWatchlistItem({
    Key? key,
    required this.watchModel,
  }) : super(key: key);

  final WatchModel watchModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (watchModel.datePicker ?? DateTime.now().toIso8601String())
                .formatMovieDate(isList: false)[0],
            style: titleMedium.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            watchModel.timeShowDate ?? '',
            style: titleMedium.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SolidButton(
            title: AppLocalizations.shared.btnGetTicket,
            height: 32,
            borderRadius: 16,
            onPressed: () {
              openUrl(url: watchModel.website ?? '');
            },
            titleStyle: titleMedium.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

class _BuildSubIconWidget extends StatelessWidget {
  const _BuildSubIconWidget({
    Key? key,
    required this.subIcons,
  }) : super(key: key);
  final List<String> subIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, idx) {
            return SizedBox(
              width: 66,
              height: 66,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: subIcons[idx],
                  placeholder: (context, url) => const ImageErrorView(),
                  errorWidget: (context, url, error) => const ImageErrorView(),
                ),
              ),
            );
          },
          separatorBuilder: (ctx, idx) {
            return const SizedBox(
              width: 16,
            );
          },
          itemCount: subIcons.length),
    );
  }
}
