
package me.advy.sdk.flutter.advy_flutter_sdk;

import me.advy.sdk.Advy;
import org.json.JSONObject;


class AdvyListener implements Advy.Callback {
    private final io.flutter.plugin.common.MethodChannel.Result result;

    AdvyListener(io.flutter.plugin.common.MethodChannel.Result result) {
        this.result = result;
    }

    @Override
    public void onDeepLinkDataInitialized(JSONObject deepLinkData) {
        result.success(deepLinkData.toString());
    }

    @Override
    public void onInitialized(boolean isInitialized) {
        result.success(isInitialized);
    }

}

