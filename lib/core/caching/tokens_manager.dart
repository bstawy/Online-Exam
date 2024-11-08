import 'secure_storage_factory.dart';

class TokensConstants {
  static const String token = 'token';
  static const String tempToken = 'tempToken';
}

class TokensManager {
  static Future<String?> getToken() async {
    String? accessToken =
        await SecureStorageFactory.read(TokensConstants.token);

    return accessToken;
  }

  static Future<String?> isTokenTemp() async {
    String? accessToken =
        await SecureStorageFactory.read(TokensConstants.tempToken);

    return accessToken;
  }

  static Future<void> setToken(String token) async {
    await SecureStorageFactory.write(
      key: TokensConstants.token,
      value: token,
    );
  }

  static Future<void> setTempToken(String value) async {
    await SecureStorageFactory.write(
      key: TokensConstants.tempToken,
      value: value,
    );
  }

  static Future<void> deleteToken() async {
    await SecureStorageFactory.delete(TokensConstants.token);
  }

  static Future<void> deleteTempToken() async {
    await SecureStorageFactory.delete(TokensConstants.tempToken);
  }

  static Future<void> clear() async {
    await SecureStorageFactory.delete(TokensConstants.token);
    await SecureStorageFactory.delete(TokensConstants.tempToken);
  }
}
