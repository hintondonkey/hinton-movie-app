enum HTTPRequestMethods { get, post, patch, delete }

class ApiUrl {
  static const listMovie = 'movie/stream/';
}

mixin BaseURL {
  static const devLocal = 'http://localhost:8000';
  static const prod = '';
}
