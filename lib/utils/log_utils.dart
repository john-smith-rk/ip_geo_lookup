import 'package:flutter/foundation.dart';

class LogUtils{
  static void logD(String message){
    if (kDebugMode) {
      print(message);
    }
  }
}