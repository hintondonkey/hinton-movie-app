import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/index.dart';
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

  List<String> listPaths = [
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80',
    'https://marketplace.canva.com/EAFHm4JWsu8/1/0/1600w/canva-pink-landscape-desktop-wallpaper-HGxdJA_xIx0.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3WhCJb54PbXEdCWqAaGiaUJRnIXFyJFmo4EGWqw7ilXP0-9G_4WIhzlqJwzb6ei4NUZQ&usqp=CAU',
    'https://c4.wallpaperflare.com/wallpaper/108/140/869/digital-digital-art-artwork-fantasy-art-drawing-hd-wallpaper-thumb.jpg',
    'https://c4.wallpaperflare.com/wallpaper/325/140/18/alone-stars-purple-background-hd-wallpaper-preview.jpg',
  ];

  @override
  void stateListenerHandler(BaseState state) async {
    super.stateListenerHandler(state);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
    _refreshController.dispose();
  }

  void _onRefresh() {
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
          children: [
            const SizedBox(
              height: 32,
            ),
            _BuildSlideView(urls: listPaths),
            const SizedBox(
              height: 34,
            ),
            const _BuildContentView(
                content:
                    '''Set around a family gathering to celebrate Easter Sunday, the comedy is based on Jo Koy’s life experiences and stand-up comedy... Read more'''),
            const SizedBox(
              height: 32,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, idx) {
                  return const _BuildWatchlistItem();
                },
                separatorBuilder: (ctx, idx) {
                  return const SizedBox(
                    height: 26,
                  );
                },
                itemCount: 10),
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
  }) : super(key: key);
  final List<String> urls;

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
        height: 424,
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
      trimLines: 3,
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
  }) : super(key: key);

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
            (DateTime.now().toIso8601String())
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
            (DateTime.now().toIso8601String())
                .formatToTimeString(),
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
              openUrl(url: 'https:google.com');
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
