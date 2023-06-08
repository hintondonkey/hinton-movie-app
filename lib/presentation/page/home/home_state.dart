import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class HomeState extends BaseState {
  final List<MovieModel>? movies;

  HomeState({
    LoadingStatus? loadingStatus,
    Failure? failure,
    this.movies,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  HomeState copyWith({
    LoadingStatus? loadingStatus,
    Failure? failure,
    List<MovieModel>? movies,
  }) {
    return HomeState(
      loadingStatus: loadingStatus,
      failure: failure,
      movies: movies ?? this.movies,
    );
  }
}
