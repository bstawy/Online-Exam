import 'dart:developer';

import 'package:flutter/foundation.dart';
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

    if (kDebugMode) {
      log('key: $key\nvalue: $value', name: 'SecureStorage - WRITE');
    }
  }

  static Future<String?> read(String key) async {
    final storage = await getInstance();
    final value = await storage.read(key: key);

    if (kDebugMode) {
      log('read key: $key\nvalue: $value', name: 'SecureStorage - READ');
    }

    return value;
  }

  static Future<void> delete(String key) async {
    final storage = await getInstance();
    await storage.delete(key: key);

    if (kDebugMode) {
      log('delete key: $key', name: 'SecureStorage - DELETE');
    }
  }
}
