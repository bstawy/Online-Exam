import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageFactory {
  SecureStorageFactory._();

  static FlutterSecureStorage? _instance;

  static Future<FlutterSecureStorage> getInstance() async {
    _instance ??= const FlutterSecureStorage();
    return _instance!;
  }

  static Future<void> write(
      {required String key, required String value}) async {
    final storage = await getInstance();
    await storage.write(key: key, value: value);
  }

  static Future<String?> read(String key) async {
    final storage = await getInstance();
    return await storage.read(key: key);
  }

  static Future<void> delete(String key) async {
    final storage = await getInstance();
    await storage.delete(key: key);
  }
}
