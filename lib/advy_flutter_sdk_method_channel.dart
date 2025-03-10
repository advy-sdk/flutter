import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'advy_flutter_sdk_platform_interface.dart';

/// An implementation of [AdvyFlutterSdkPlatform] that uses method channels.
class MethodChannelAdvyFlutterSdk extends AdvyFlutterSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('advy_flutter_sdk');

  @override
  Future<bool?> init(String appId, String appKey)  {
    return methodChannel.invokeMethod<bool>('init', <String, String>{
      'appId': appId,
      'appKey': appKey,
    });
  }

  @override
  Future<bool?> isInitialized() {
    return methodChannel.invokeMethod<bool>('isInitialized');
  }

  @override
  Future<String?> setId(String id) {
    return methodChannel.invokeMethod<String>('setId', <String, String>{
      'id': id,
    });
  }

  @override
  Future<String?> event(String name, Map<String, dynamic> data) {
    return methodChannel.invokeMethod<String>('event', <String, dynamic>{
      'name': name,
      'data': data,
    });
  }

  @override
  Future<String?> getDeepLinkData() {
    return methodChannel.invokeMethod<String>('getDeepLinkData');
  }

}
