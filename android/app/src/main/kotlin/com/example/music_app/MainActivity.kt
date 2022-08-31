package com.example.music_app

import android.content.Context
import androidx.multidex.MultiDex
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun attachBaseContext(newBase: Context?) {
        super.attachBaseContext(newBase)
        MultiDex.install(this)
    }
}
