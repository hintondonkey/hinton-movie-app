import 'package:movie_app/presentation/base/index.dart';

abstract class HomeEvent extends BaseEvent {}

class FetchMoviesEvent extends HomeEvent {}

class NavigateToMovieDetailScreenEvent extends FetchMoviesEvent {
  final int movieId;
  final String title;

  NavigateToMovieDetailScreenEvent({
    required this.movieId,
    required this.title,
  });
}
