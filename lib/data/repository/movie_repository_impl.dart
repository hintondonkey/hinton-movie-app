import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/repository/index.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi _movieApi;

  MovieRepositoryImpl(
    this._movieApi,
  );

  @override
  Future<List<MovieModel>> fetchMovies() async {
    return (await _movieApi.fetchMovies());
  }

  @override
  Future<MovieModel> fetchMovieDetail(
      {required GetMovieDetailParam param}) async {
    return (await _movieApi.fetchMovieDetail(param: param));
  }
}
