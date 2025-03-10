import 'package:flutter_test/flutter_test.dart';
import 'package:advy_flutter_sdk/advy_flutter_sdk.dart';
import 'package:advy_flutter_sdk/advy_flutter_sdk_platform_interface.dart';
import 'package:advy_flutter_sdk/advy_flutter_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAdvyFlutterSdkPlatform
    with MockPlatformInterfaceMixin
    implements AdvyFlutterSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> init(String appId, String appKey) {
    return Future.value(true);
  }

  @override
  Future<bool?> isInitialized() {
    throw UnimplementedError();
  }

  @override
  Future<String?> setId(String id) {
    // TODO: implement setId
    throw UnimplementedError();
  }

  @override
  Future<String?> event(String name, Map<String, dynamic> params) {
    // TODO: implement event
    throw UnimplementedError();
  }

  @override
  Future<String?> getDeepLinkData() {
    // TODO: implement getDeepLinkData
    throw UnimplementedError();
  }
}

void main() {
  final AdvyFlutterSdkPlatform initialPlatform = AdvyFlutterSdkPlatform.instance;

  test('$MethodChannelAdvyFlutterSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAdvyFlutterSdk>());
  });
}
