import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'api_url.dart';
import 'dio_provider.dart';
import 'error_from_server.dart';
enum Methods { get, post, patch, delete }

class APIDataStore {
  Dio dio = DioProvider.instance();

  APIDataStore();

  // Public Request API
  Future<dynamic> requestAPI(String url,
      {Map<String, dynamic>? params,
      required Methods methods,
      Map<String, dynamic>? body,
      FormData? formData,
      String? customUrl}) async {
    dynamic bodyRequest;
    if (body != null) {
      bodyRequest = jsonEncode(body);
    } else if (formData != null) {
      bodyRequest = formData;
    }
    try {
       late Response response;
      switch (methods) {
        case Methods.get:
          response = await dio.get(url, queryParameters: params);
          break;
        case Methods.post:
          response = await dio.post(url,
              queryParameters: params, data: bodyRequest);
          break;
        case Methods.delete:
          response = await dio.delete(url,
              queryParameters: params, data: bodyRequest);
          break;
        default:
          break;
      }

      if (response.data['error'] == true) {
        // if (response.data['MessageCode'] == 1111) {
        //   throw ErrorFromServer.unAuthorize();
        // }
        throw ErrorFromServer.unknownError();
      }
      return response.data;
    } on SocketException catch (_) {
      throw ErrorFromServer.noInternetConnection();
    } on DioError catch (e) {
      if (e.response != null) {
        throw ErrorFromServer.fromJson(e.response!.data);
      } else {
        throw ErrorFromServer.unknownError();
      }
    }
  }
}
