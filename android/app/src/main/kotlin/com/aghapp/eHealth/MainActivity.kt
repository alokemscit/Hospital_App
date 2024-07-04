package com.aghapp.eHealth

import android.content.Intent
import android.content.IntentSender
import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.annotation.NonNull
import com.google.android.gms.tasks.Task
import com.google.android.play.core.appupdate.AppUpdateInfo
import com.google.android.play.core.appupdate.AppUpdateManager
import com.google.android.play.core.appupdate.AppUpdateManagerFactory
import com.google.android.play.core.appupdate.AppUpdateOptions
import com.google.android.play.core.install.model.AppUpdateType
import com.google.android.play.core.install.model.UpdateAvailability

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private lateinit var appUpdateManager: AppUpdateManager
    private val IMMEDIATE_APP_UPDATE_REQ_CODE = 124
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.i("MainActivity", "OK-1")
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.decorView.systemUiVisibility = (
                    View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or
                            View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
                            View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                            View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or
                            View.SYSTEM_UI_FLAG_FULLSCREEN or
                            View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                    )
            window.statusBarColor = android.graphics.Color.TRANSPARENT
           // window.navigationBarColor = android.graphics.Color.TRANSPARENT
        }
         
        appUpdateManager = AppUpdateManagerFactory.create(applicationContext)
        checkForAppUpdate()

    }

    private fun checkForAppUpdate() {
        val appUpdateInfoTask = appUpdateManager.appUpdateInfo
        Log.i("MainActivity", "OK-2")
        appUpdateInfoTask.addOnSuccessListener { appUpdateInfo ->
            if (appUpdateInfo.updateAvailability() == UpdateAvailability.UPDATE_AVAILABLE &&
                appUpdateInfo.isUpdateTypeAllowed(AppUpdateType.IMMEDIATE)) {
                startUpdateFlow(appUpdateInfo)
            } else if (appUpdateInfo.updateAvailability() == UpdateAvailability.DEVELOPER_TRIGGERED_UPDATE_IN_PROGRESS) {
                startUpdateFlow(appUpdateInfo)
            }
        }
    }

    private fun startUpdateFlow(appUpdateInfo: AppUpdateInfo) {
        try {
            appUpdateManager.startUpdateFlowForResult(
                appUpdateInfo,
                this,
                AppUpdateOptions.newBuilder(AppUpdateType.IMMEDIATE)
                    .setAllowAssetPackDeletion(true)
                    .build(),
                IMMEDIATE_APP_UPDATE_REQ_CODE
            )
        } catch (e: IntentSender.SendIntentException) {
            e.printStackTrace()
        }
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.aghapp.eHealth/update")
            .setMethodCallHandler { call, result ->
                if (call.method == "checkForAppUpdate") {
                    checkForAppUpdate()
                    result.success("ok-method call")
                }else if(call.method=="status_bar_change"){
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        window.decorView.systemUiVisibility = (
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN)
                        window.statusBarColor = android.graphics.Color.TRANSPARENT
                       // window.navigationBarColor = android.graphics.Color.TRANSPARENT
                    }
                    result.success("ok-method call 2")
                }
                
                else {
                    result.notImplemented()
                }
            }
    }



}
