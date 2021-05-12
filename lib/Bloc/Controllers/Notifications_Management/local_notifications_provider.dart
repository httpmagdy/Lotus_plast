import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../../ui/screen/Notification/notification_screen.dart';

showNotification({title, body}) async {
  var android = AndroidNotificationDetails(
      'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
      priority: Priority.high, importance: Importance.max);
  var iOS = IOSNotificationDetails();
  var platform = NotificationDetails(android: android, iOS: iOS);
  await flutterLocalNotificationsPlugin.show(
    0,
    '$title',
    '$body',
    platform,
    payload: 'AndroidCoding.in',
  );
}

Future onSelectNotification(String payload) {
  debugPrint("payload : $payload");
  Get.to(NotificationScreen());

  print("============");
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void localNotification() {
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings android =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final IOSInitializationSettings iOS = IOSInitializationSettings(
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: android,
    iOS: iOS,
  );
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);
}

//
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// showNotification({title, body}) async {
//   var android = AndroidNotificationDetails(
//       'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
//       priority: Priority.high, importance: Importance.max);
//
//   _createNotificationChannel();
//
//
//   var iOS = IOSNotificationDetails();
//   var platform = NotificationDetails(android: android, iOS: iOS);
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     '$title',
//     '$body',
//     platform,
//     payload: 'AndroidCoding.in',
//   );
// }
//
// Future onSelectNotification(String payload) {
//   debugPrint("payload : $payload");
//   print("============");
// }
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// Future<void> initializeLocalNotifications() async {
//
//   // app_icon needs to be a added as a drawable resource to the
//   // Android head project
//
//   var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
//   var initializationSettingsIOS = IOSInitializationSettings();
//   var initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsIOS,
//   );
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: selectNotification);
//
// }
//
// Future<void> _createNotificationChannel(String id, String name,
//     String description) async {
//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   var androidNotificationChannel = AndroidNotificationChannel(
//     id,
//     name,
//     description,
//   );
//
//   await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(androidNotificationChannel);
// }
//
//
// Future selectNotification(String payload) {
//   debugPrint("payload : $payload");
//   print("============");
// }
