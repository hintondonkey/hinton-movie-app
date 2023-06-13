import 'package:movie_app/data/remote/base/index.dart';

class AuthApiImpl extends BaseApi implements AuthApi {
  @override
  Future<bool> logout() async {
    return true;
  }
}
