import 'dart:convert';
import 'package:jetdriver/service/hive_service.dart'; // ganti sesuai path

class AuthUtils {
  static bool isLoggedIn() {
    final token = HiveService().get<String>('token');
    if (token == null || token.isEmpty) return false;

    try {
      final parts = token.split('.');
      if (parts.length != 3) return false;

      final payload = jsonDecode(
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));

      if (payload is! Map || !payload.containsKey('exp')) return false;

      final exp = payload['exp'];
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      return exp > now;
    } catch (_) {
      return false;
    }
  }
}
