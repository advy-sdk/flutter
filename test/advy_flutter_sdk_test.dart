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
}

void main() {
  final AdvyFlutterSdkPlatform initialPlatform = AdvyFlutterSdkPlatform.instance;

  test('$MethodChannelAdvyFlutterSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAdvyFlutterSdk>());
  });

  test('getPlatformVersion', () async {
    AdvyFlutterSdk advyFlutterSdkPlugin = AdvyFlutterSdk();
    MockAdvyFlutterSdkPlatform fakePlatform = MockAdvyFlutterSdkPlatform();
    AdvyFlutterSdkPlatform.instance = fakePlatform;

    expect(await advyFlutterSdkPlugin.getPlatformVersion(), '42');
  });
}
