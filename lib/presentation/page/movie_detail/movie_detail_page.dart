import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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

class MovieDetailPage extends BasePage {
  const MovieDetailPage({
    required PageTag pageTag,
    Key? key,
    required this.movieId,
    required this.title,
  }) : super(tag: pageTag, key: key);

  final int movieId;
  final String title;

  @override
  State<StatefulWidget> createState() => MovieDetailPageState();
}

class MovieDetailPageState
    extends BasePageState<MovieDetailBloc, MovieDetailPage, MovieDetailRouter> {
  StreamSubscription? _subscription;
  final RefreshController _refreshController = RefreshController();

  @override
  void stateListenerHandler(BaseState state) async {
    super.stateListenerHandler(state);
  }

  @override
  void initState() {
    super.initState();
    bloc.dispatchEvent(FetchMovieDetailEvent(
      movieId: widget.movieId,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
    _refreshController.dispose();
  }

  @override
  Widget buildLayout(BuildContext context, BaseBloc bloc) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (ctx, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryBgrColor,
          appBar: HintonAppBar(
            title: widget.title,
          ),
          body: SmartRefresher(
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
      );
    });
  }

  void _onRefresh() {
    bloc.dispatchEvent(FetchMovieDetailEvent(
      movieId: widget.movieId,
    ));
    _refreshController.refreshCompleted();
  }

  _buildBody({required MovieDetailState state}) {
    return state.movie != null
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  _BuildImageView(url: state.movie?.image ?? ''),
                  const SizedBox(
                    height: 26,
                  ),
                  const Visibility(
                    visible: false,
                    child: Column(
                      children: [
                        DotsIndicator(dotsCount: 3),
                        SizedBox(
                          height: 26,
                        ),
                      ],
                    ),
                  ),

                  _BuildContentView(content: state.movie?.description ?? ''),
                  const SizedBox(
                    height: 32,
                  ),
                  state.movie?.watchlist?.isNotEmpty == true
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, idx) {
                            return _BuildWatchlistItem(
                                watchlist: state.movie!.watchlist![idx]);
                          },
                          separatorBuilder: (ctx, idx) {
                            return const SizedBox(
                              height: 46,
                            );
                          },
                          itemCount: state.movie?.watchlist?.length ?? 0)
                      : const SizedBox(),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          )
        : const NoDataWidget();
  }
}

class _BuildImageView extends StatelessWidget {
  const _BuildImageView({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: url,
          placeholder: (context, url) => const ImageErrorView(),
          errorWidget: (context, url, error) => const ImageErrorView(),
        ),
      ),
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
    required this.watchlist,
  }) : super(key: key);

  final WatchModel watchlist;

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
            (watchlist.datePicker ?? '').formatMovieDate(isList: false)[0],
            style: titleMedium.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            watchlist.timeShowDate ?? '',
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
            onPressed: (){
              openUrl(url: watchlist.website ?? '');
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
