import 'package:movie_app/domain/model/index.dart';

abstract class AuthApi {
  Future<bool> logout();
}

abstract class MovieApi {
  Future<List<MovieModel>> fetchMovies();

  Future<MovieModel> fetchMovieDetail({required GetMovieDetailParam param});
}

abstract class CategoryApi {

  Future<List<CategoryModel>> fetchCategories({required FetchCategoriesParam param});

}
