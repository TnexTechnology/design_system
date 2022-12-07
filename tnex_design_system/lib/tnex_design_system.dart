
import 'dart:async';

import 'package:flutter/services.dart';

class TnexDesignSystem {
  static const MethodChannel _channel = MethodChannel('tnex_design_system');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
