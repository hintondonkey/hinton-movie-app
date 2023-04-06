import 'package:g_json/g_json.dart';
import 'package:movie_app/domain/model/movies_response.dart';

import '../../data/remote/api/barrel_api.dart';

class GetMoviesUsecase {
  APIDataStore apiDataStore = APIDataStore();

  Future<List<MoviesResponse>> getMoviesApi() async {
    try {
      final res =
          await apiDataStore.requestAPI(ApiUrl.listMovie, methods: Methods.get);
      return moviesResponseFromJson(res.toString());
    } catch (err) {
      print(err.toString());
      List<MoviesResponse> listerror = [];
      return listerror;
    }
  }
}
