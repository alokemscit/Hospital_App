import 'package:flutter/services.dart';

class AppUpdateService {
  static const MethodChannel _channel = MethodChannel('com.aghapp.eHealth/update');

  static Future<void> checkForAppUpdate() async {
    try {
      await _channel.invokeMethod('checkForAppUpdate');
    } on PlatformException catch (e) {
      print("Failed to check for update: '${e.message}'.");
    }
  }
}