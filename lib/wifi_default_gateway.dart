import 'dart:async';

import 'package:flutter/services.dart';

class WifiDefaultGateway {
  static const MethodChannel _channel =
      const MethodChannel('isaacparker.co/wifi_default_gateway');

  static Future<String> get gatewayIP =>
    _channel.invokeMethod('getGatewayIP');
}
