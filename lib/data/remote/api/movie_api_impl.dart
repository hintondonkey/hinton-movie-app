import 'package:movie_app/data/net/index.dart';
import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/domain/model/movie/get_movie_detail_param.dart';
import 'package:movie_app/domain/model/movie/movie_model.dart';

class MovieApiImpl extends BaseApi implements MovieApi {
  @override
  Future<List<MovieModel>> fetchMovies() async {
    final connection = await initConnection();
    final json = await connection.execute(ApiInput(
      endPointProvider!.endpoints['fetch_movies']!,
    ));
    List<MovieModel> movies = [];
    if (json != null && json is List<dynamic>) {
      movies = json.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
    }
    return movies;
  }

  @override
  Future<MovieModel> fetchMovieDetail(
      {required GetMovieDetailParam param}) async {
    final connection = await initConnection();
    final json = await connection.execute(ApiInput(
      endPointProvider!.endpoints['movie_detail']!
          .appendPath('${param.movieId}'),
    ));
    MovieModel model = MovieModel.fromJson(json);
    return model;
  }
}
