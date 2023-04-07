import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/data/remote/api/api_url.dart';

class DioProvider {
  static Dio instance() {
    final dio = Dio()
    ..options.baseUrl = BaseURL.prod
    ..interceptors.add(HttpLogInterceptor());
    return dio;
  }
}

class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      log('onRequest: ${options.uri}\n'
          'data=${options.data}\n'
          'method=${options.method}\n'
          'headers=${options.headers}\n'
          'queryParameters=${options.queryParameters}');
    }
    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      log('onRequest: ${response.realUri}');
      log('onResponse: $response');
    }
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      log('onError: $err\n'
          'Response: ${err.response}');
  }
    return super.onError(err, handler);
  }
}
