package com.creazyidea.lotus_plast

import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin

class FirebaseCloudMessagingPluginRegistrant {
    companion object {
        fun registerWith(registry: PluginRegistry) {
            if (alreadyRegisteredWith(registry)) {
                return;
            }
            FirebaseMessagingPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"))
        }

        fun alreadyRegisteredWith(registry: PluginRegistry): Boolean {
            val key = FirebaseCloudMessagingPluginRegistrant::class.java.name
            if (registry.hasPlugin(key)) {
                return true
            }
            registry.registrarFor(key)
            return false
        }
    }
}




//package com.creazyidea.lotus_plast
//
//import io.flutter.plugin.common.PluginRegistry
////import io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin
//import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin
//
//class FlutterLocalNotificationPluginRegistrant {
//
//    companion object {
//        fun registerWith(registry: PluginRegistry) {
//            if (alreadyRegisteredWith(registry)) {
////                Log.d("Local Plugin", "Already Registered");
//                return
//            }
//            FlutterLocalNotificationsPlugin.registerWith(registry.registrarFor("com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin"))
////            Log.d("Local Plugin", "Registered");
//        }
//
//        private fun alreadyRegisteredWith(registry: PluginRegistry): Boolean {
//            val key = FlutterLocalNotificationPluginRegistrant::class.java.canonicalName
//            if (registry.hasPlugin(key)) {
//                return true
//            }
//            registry.registrarFor(key)
//            return false
//        }
//    }}