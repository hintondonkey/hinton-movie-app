import 'package:movie_app/presentation/base/index.dart';

abstract class MovieDetailEvent extends BaseEvent {}

class FetchMovieDetailEvent extends MovieDetailEvent {
  int movieId;

  FetchMovieDetailEvent({
    required this.movieId,
  });
}
