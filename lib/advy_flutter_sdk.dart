
import 'advy_flutter_sdk_platform_interface.dart';

class AdvyFlutterSdk {
  Future<String?> getPlatformVersion() {
    return AdvyFlutterSdkPlatform.instance.getPlatformVersion();
  }
}
