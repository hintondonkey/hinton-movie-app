import 'package:dio/dio.dart';
import 'package:g_json/g_json.dart';
import 'package:movie_app/domain/model/movies_response.dart';

import '../../data/remote/api/barrel_api.dart';

class GetMoviesUsecase {
  APIDataStore apiDataStore = APIDataStore();

  Future<List<MoviesResponse>> getMoviesApi() async {
    try {
      Response res =
          await apiDataStore.requestAPI(ApiUrl.listMovie, methods: Methods.get);
      List<MoviesResponse> movies = (res.data as List)
          .map((movie) => MoviesResponse.fromJson(movie))
          .toList();
      return movies;
    } catch (err) {
      print(err.toString());
      List<MoviesResponse> listerror = [];
      return listerror;
    }
  }

  Future<MoviesResponse> getMoviesDetailApi(int id) async {
    Response res = await apiDataStore.requestAPI("${ApiUrl.movieDetail}/$id",
        methods: Methods.get);
    return MoviesResponse.fromJson(res.data);
  }
}
