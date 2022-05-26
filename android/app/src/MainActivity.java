package com.example.el_edary

import io.flutter.embedding.android.FlutterActivity
public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, @androidx.annotation.Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        flutterEngine.getActivityControlSurface().onActivityResult(requestCode, resultCode, data);
    }
}