import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:advy_flutter_sdk/advy_flutter_sdk_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAdvyFlutterSdk platform = MethodChannelAdvyFlutterSdk();
  const MethodChannel channel = MethodChannel('advy_flutter_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

}
