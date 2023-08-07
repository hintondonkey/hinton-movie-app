import 'package:movie_app/domain/provider/index.dart';

const baseApiUrlDev = 'https://stephenkiendinh.com/';
const baseApiUrlProd = 'https://stephenkiendinh.com/';
const baseImageUrlDev = '';
const baseImageUrlProd = '';

const kBrokerId = 2;

class ImageHostProvider {
  String baseImageUrl = '';
}

var imageHostProvider = ImageHostProvider();

abstract class ApiConfig {
  late String baseUrl;
  late int connectTimeout;
  late int receiveTimeout;
}

class ApiConfigImpl extends ApiConfig {
  final EnvironmentProvider environmentProvider;

  ApiConfigImpl(
    this.environmentProvider,
  );

  @override
  String get baseUrl {
    final evn = environmentProvider.getCurrentFlavor();
    switch (evn) {
      case EnvironmentFlavor.dev:
        return baseApiUrlDev;
      case EnvironmentFlavor.prod:
        return baseApiUrlProd;
    }
  }

  @override
  int get connectTimeout => 30000;

  @override
  int get receiveTimeout => 30000;
}
