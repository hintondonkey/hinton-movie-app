import 'package:flutter/material.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/navigator/page_navigator.dart';
import 'package:movie_app/presentation/page/home/index.dart';
import 'package:movie_app/presentation/page/movie_detail/index.dart';
import 'package:movie_app/presentation/utils/index.dart';

class HomeRouter with BaseRouter {
  @override
  onNavigateByState(
      {required BuildContext context, required BaseState state}) {}

  @override
  onNavigateByEvent({required BuildContext context, required BaseEvent event}) {
    if (event is NavigateToMovieDetailScreenEvent) {
      navigator.materialPushIfNotCurrent(
          context: context,
          page: MovieDetailPage(
            pageTag: PageTag.movieDetail,
            movieId: event.movieId,
            title: event.title,
          ));
    }
  }
}
