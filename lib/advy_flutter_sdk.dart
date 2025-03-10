
import 'dart:io';

import 'advy_flutter_sdk_platform_interface.dart';

class AdvyFlutterSdk {
  Future<bool?> init({required String appId, required String appKey}) {
    if(Platform.isAndroid){
      return AdvyFlutterSdkPlatform.instance.init(appId, appKey);
    }
    else{
      return Future.value(null);
    }
  }

  Future<bool?> isInitialized() {
    if(Platform.isAndroid){
      return AdvyFlutterSdkPlatform.instance.isInitialized();
    }
    else{
      return Future.value(null);
    }
  }

  Future<String?> setId({required String id}) {
    if(Platform.isAndroid){
      return AdvyFlutterSdkPlatform.instance.setId(id);
    }
    else{
      return Future.value(null);
    }
  }

  Future<String?> event({required String name, required Map<String, dynamic> data}) {
    if(Platform.isAndroid){
      return AdvyFlutterSdkPlatform.instance.event(name, data);
    }
    else{
      return Future.value(null);
    }
  }

  Future<String?> getDeepLinkData() {
    if(Platform.isAndroid){
      return AdvyFlutterSdkPlatform.instance.getDeepLinkData();
    }
    else{
      return Future.value(null);
    }
  }
}
