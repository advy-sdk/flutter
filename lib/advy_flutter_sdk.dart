
import 'advy_flutter_sdk_platform_interface.dart';

class AdvyFlutterSdk {
  void init(String appId, String appKey) {
    AdvyFlutterSdkPlatform.instance.init(appId, appKey);
  }
}
