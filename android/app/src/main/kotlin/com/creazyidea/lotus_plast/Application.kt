//package com.creazyidea.lotus_plast
//
//import io.flutter.app.FlutterApplication
//import io.flutter.plugin.common.PluginRegistry
//import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
////import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin
//

package com.creazyidea.lotus_plast

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService

public class Application: FlutterApplication(), PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
        FlutterFirebaseMessagingService.setPluginRegistrant(this)
    }

    override fun registerWith(registry: PluginRegistry) {
        FirebaseCloudMessagingPluginRegistrant.registerWith(registry)
    }
}








//class Application : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {
//
//    override fun onCreate() {
//        super.onCreate()
//    }
//
//    override fun registerWith(registry: PluginRegistry?) {
//        if (registry != null) {
//            FlutterLocalNotificationPluginRegistrant.registerWith(registry)
//        }
//    }}
//
////
////public class Application: FlutterApplication(), PluginRegistrantCallback {
////    override fun onCreate() {
////        super.onCreate()
////
////        FlutterFirebaseMessagingService.setPluginRegistrant(this)
////    }
////
////    override fun registerWith(registry: PluginRegistry) {
////        FirebaseCloudMessagingPluginRegistrant.registerWith(registry)
////    }
////}
//

//
//package com.creazyidea.lotus_plast
//
//import io.flutter.app.FlutterApplication
//import io.flutter.plugin.common.PluginRegistry
//import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
//import io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin
//import io.flutter.view.FlutterMain
//import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService
//import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin
//
//class Application : FlutterApplication(), PluginRegistrantCallback {
//
//    override fun onCreate() {
//        super.onCreate()
//        FlutterFirebaseMessagingService.setPluginRegistrant(this);
//        FlutterMain.startInitialization(this)
//    }
//
//    override fun registerWith(registry: PluginRegistry?) {
//        FirebaseMessagingPlugin.registerWith(registry!!.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"));
//        FlutterLocalNotificationsPlugin.registerWith(registry!!.registrarFor("com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin"));
//    }
//}