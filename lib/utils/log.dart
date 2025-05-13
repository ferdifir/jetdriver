import 'package:flutter/foundation.dart';

class Log {
  static void d(String message) {
    if (kDebugMode) {
      var now = DateTime.now().toIso8601String();
      print("[DEBUG] [$now] $message");
    }
  }
}