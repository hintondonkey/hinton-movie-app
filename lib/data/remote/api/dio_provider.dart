import 'package:dio/dio.dart';
import 'package:movie_app/data/remote/api/api_url.dart';

class DioProvider {
  static Dio instance() {
    final dio = Dio()..options.baseUrl = BaseURL.devLocal;
    return dio;
  }
}

