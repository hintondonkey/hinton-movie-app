import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class MovieDetailState extends BaseState {
  MovieDetailState({
    LoadingStatus? loadingStatus,
    Failure? failure,
    this.movie,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  final MovieModel? movie;

  MovieDetailState copyWith({
    LoadingStatus? loadingStatus,
    Failure? failure,
    MovieModel? movie,
  }) {
    return MovieDetailState(
      loadingStatus: loadingStatus,
      failure: failure,
      movie: movie ?? this.movie,
    );
  }
}
