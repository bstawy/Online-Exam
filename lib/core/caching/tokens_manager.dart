import 'secure_storage_factory.dart';

class TokensConstants {
  static const String token = 'token';
}

class TokensManager {
  static Future<String?> getToken() async {
    String? accessToken =
        await SecureStorageFactory.read(TokensConstants.token);

    return accessToken;
  }

  static Future<void> setToken(String token) async {
    await SecureStorageFactory.write(
      key: TokensConstants.token,
      value: token,
    );
  }

  static Future<void> deleteToken() async {
    await SecureStorageFactory.delete(TokensConstants.token);
  }
}
