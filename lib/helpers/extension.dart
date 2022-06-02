import 'package:flutter/foundation.dart';

class Helpers {
  Helpers._();

  static logger(String message) {
    if (kDebugMode) {
      debugPrint(message);
    }
  }
}
