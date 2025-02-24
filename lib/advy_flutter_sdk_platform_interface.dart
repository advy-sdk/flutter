import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'advy_flutter_sdk_method_channel.dart';

abstract class AdvyFlutterSdkPlatform extends PlatformInterface {
  /// Constructs a AdvyFlutterSdkPlatform.
  AdvyFlutterSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static AdvyFlutterSdkPlatform _instance = MethodChannelAdvyFlutterSdk();

  /// The default instance of [AdvyFlutterSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelAdvyFlutterSdk].
  static AdvyFlutterSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AdvyFlutterSdkPlatform] when
  /// they register themselves.
  static set instance(AdvyFlutterSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
