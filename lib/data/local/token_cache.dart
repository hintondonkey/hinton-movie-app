import 'dart:convert';
import 'package:movie_app/core/utils/consts.dart';
import 'package:movie_app/data/local/index.dart';
import 'package:movie_app/domain/model/index.dart';

abstract class TokenCache {
  Future<TokenModel?> getCachedToken();

  Future<bool> putToken(TokenModel token);

  Future<bool> removeCache();
}

class AuthCacheImpl extends TokenCache {
  final LocalDataStorage _storage;

  AuthCacheImpl(this._storage);

  @override
  Future<TokenModel?> getCachedToken() async {
    var jsonString = await _storage.getString(tokenKey) ?? '';
    if (jsonString.isNotEmpty) {
      final json = jsonDecode(jsonString);
      return TokenModel.fromJson(json);
    }
    return null;
  }

  @override
  Future<bool> putToken(TokenModel token) async {
    await _storage.saveString(tokenKey, jsonEncode(token.toJson()));
    return true;
  }

  @override
  Future<bool> removeCache() async {
    await _storage.remove(tokenKey);
    return true;
  }
}
