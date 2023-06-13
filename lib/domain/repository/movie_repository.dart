import 'package:movie_app/domain/model/index.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> fetchMovies();

  Future<MovieModel> fetchMovieDetail({required GetMovieDetailParam param});

}