package com.reactnativetiktok;

import android.content.Intent;
import android.net.Uri;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.core.content.FileProvider;

import com.bytedance.sdk.open.aweme.TikTokOpenApiFactory;
import com.bytedance.sdk.open.aweme.TikTokOpenConfig;
import com.bytedance.sdk.open.aweme.api.TiktokOpenApi;
import com.bytedance.sdk.open.aweme.authorize.model.Authorization;
import com.bytedance.sdk.open.aweme.base.TikTokMediaContent;
import com.bytedance.sdk.open.aweme.base.TikTokVideoObject;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

import java.io.File;
import java.util.ArrayList;

@ReactModule(name = TiktokModule.NAME)
public class TiktokModule extends ReactContextBaseJavaModule {
    public static final String NAME = "Tiktok";

    public TiktokModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }


    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    public void init(String key) {
      TikTokOpenApiFactory.init(new TikTokOpenConfig(key));
    }

    @ReactMethod
    public void auth(String stateKey, Callback callBack) {
      TiktokOpenApi tiktokOpenApi = TikTokOpenApiFactory.create(getReactApplicationContext());
      Authorization.Request request = new Authorization.Request();
      request.scope = "user.info.basic,video.list";
      request.state = stateKey;
      request.callerLocalEntry = "com.reactnativetiktok.TikTokEntryActivity";
      tiktokOpenApi.authorize(request);
    }
}
