import 'package:movie_app/data/local/index.dart';
import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/domain/repository/index.dart';
import 'package:movie_app/presentation/utils/index.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  final TokenCache _tokenCache;
  final PushNotificationHandler _pushNotificationHandler;

  AuthRepositoryImpl(
    this._authApi,
    this._tokenCache,
    this._pushNotificationHandler,
  );

  @override
  Future<bool> isLogged() async {
    var tokenCached = await _tokenCache.getCachedToken();
    bool isLogged = (tokenCached?.token.isNotEmpty ?? false);
    return isLogged;
  }

  @override
  Future<bool> logout({bool remoteLogout = false}) async {
    if (remoteLogout) {
      bool result = false;
      try {
        result = await _authApi.logout();
      } finally {
        clearCached();
      }
      return result;
    }
    await clearCached();
    return true;
  }

  Future clearCached() async {
    await Future.wait([
      _tokenCache.removeCache(),
      _pushNotificationHandler.clear(),
    ]);
  }
}
