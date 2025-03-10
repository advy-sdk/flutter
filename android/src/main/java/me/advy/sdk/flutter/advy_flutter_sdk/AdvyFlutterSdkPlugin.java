package me.advy.sdk.flutter.advy_flutter_sdk;

import androidx.annotation.NonNull;
import android.content.Intent;
import android.content.Context;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.NewIntentListener;
import me.advy.sdk.Advy;

import java.util.Map;
import org.json.JSONObject;

/** AdvyFlutterSdkPlugin */
public class AdvyFlutterSdkPlugin implements
        FlutterPlugin,
        MethodCallHandler ,
        ActivityAware,
        NewIntentListener {

  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private ActivityPluginBinding binding;
  private Intent intent;
  private Context context;



  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "advy_flutter_sdk");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("init")) {
      intent = binding.getActivity().getIntent();
      context = binding.getActivity().getApplicationContext();
      AdvyListener advyListener = new AdvyListener(result);
      String appId = call.argument("appId");
      String appKey = call.argument("appKey");
      Advy.init(appId, appKey, context, intent, advyListener);
    } else if (call.method.equals("isInitialized")) {
      result.success(Advy.isInitialized());
    } else if (call.method.equals("setId")) {
      JSONObject resp = Advy.setId(call.argument("id"));
      if(resp != null) {
        result.success(resp.toString());
      } else {
        result.success(null);
      }
    } else if (call.method.equals("event")) {
      String name = call.argument("name");
      Map data = call.argument("data");
      JSONObject resp = Advy.event(name, data);
        if(resp != null) {
            result.success(resp.toString());
        } else {
            result.success(null);
        }
    } else if (call.method.equals("getDeepLinkData")) {
      AdvyListener advyListener = new AdvyListener(result);
        Advy.getDeepLinkData(advyListener);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }


  /////////////////////////////////////////////////////////////////////////////
  /// ActivityAware
  ///
  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.binding = binding;
    binding.addOnNewIntentListener(this);

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    this.binding = binding;
    binding.addOnNewIntentListener(this);
  }

  @Override
  public void onDetachedFromActivity() {
    if (binding != null) {
      binding.removeOnNewIntentListener(this);
    }
    binding = null;
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity();
  }
  ///
  /// END ActivityAware
  /////////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////////
  /// NewIntentListener
  ///
  @Override
  public boolean onNewIntent(@NonNull Intent intent) {
    return false;
  }
  ///
  /// END NewIntentListener
  /////////////////////////////////////////////////////////////////////////////

}
