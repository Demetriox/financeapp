import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Session {
  final key = "TOKEN";
  final storage = const FlutterSecureStorage();

  set(String token) async {
    final data = json.encode(token);
    await storage.write(
      key: key,
      value: data,
    );
  }

  get() async {
    final result = await storage.read(key: key);
    if (result != null) {
      return json.decode(result);
    }
    return null;
  }

  delete() async {
    await storage.delete(key: key);
  }

  clear() async {
    await storage.deleteAll();
  }
}
