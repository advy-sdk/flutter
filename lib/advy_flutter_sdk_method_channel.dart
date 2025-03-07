import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'advy_flutter_sdk_platform_interface.dart';

/// An implementation of [AdvyFlutterSdkPlatform] that uses method channels.
class MethodChannelAdvyFlutterSdk extends AdvyFlutterSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('advy_flutter_sdk');

  @override
  void init(String appId, String appKey) {
    methodChannel.invokeMethod<void>('init', <String, String>{
      'appId': appId,
      'appKey': appKey,
    });
  }
}
