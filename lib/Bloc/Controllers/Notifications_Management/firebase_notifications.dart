import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../../ui/screen/Notification/notification_screen.dart';
import 'local_notifications_provider.dart';
import 'notifications_page_provider.dart';

// Future<dynamic> myBackgroundMessageHandler( message) {
//
//   print("on Background = = = = = == = === = = == = = ==> 1111111}");
//   print("onBack ${message["data"]["body"]}");
//   print("onBack ${message["data"]["title"]}");
//
//   showNotification(body: "${message["data"]["body"]}", title: "${message["data"]["title"]}");
// }

//
// Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
//   print("BG-----------------(my Background Message Handler)--------------------");
//   print("BG-----------------(my Background Message Handler)--------------------");
//   print("BG-----------------(my Background Message Handler)--------------------");
//   print("BG-----------------(my Background Message Handler)--------------------");
//   //
//   // if (message['data'] != null) {
//   //   final data = message['data'];
//   //
//   //   final title = data['title'];
//   //   final body = data['body'];
//   //
//   //   await _showNotificationWithDefaultSound(title, body);
//   // }
//   //
//   // return Future<void>.value();
// }

// Future _showNotificationWithDefaultSound(String title, String message) async {
//
//   print("BG-------------------------------------");
//
//   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'channel_id', 'channel_name', 'channel_description',
//       importance: Importance.max, priority: Priority.high,
//   );
//
//   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   var platformChannelSpecifics = NotificationDetails(iOS:iOSPlatformChannelSpecifics, android: androidPlatformChannelSpecifics, );
//
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     '$title',
//     '$message',
//     platformChannelSpecifics,
//     payload: 'Default_Sound',
//   );
//
// }

class PushNotificationManger extends GetxController {
  // single tone
  // PushNotificationManger._();
  // factory PushNotificationManger() => _instance;
  // static PushNotificationManger _instance = PushNotificationManger._();

  // Future onDidReceiveLocalNotification(
  //     int id, String title, String body, String payload) async {
  //   // display a dialog with the notification details, tap ok to go to another page
  //
  //   Get.dialog(OkDialog(title: title, body: body,));
  // }

  // final HomeInspectorProvider _homeInspectorProvider = Get.put(HomeInspectorProvider());
  final NotificationsPageProvider _notificationsPageProvider =
      Get.put(NotificationsPageProvider());

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void configureCallback() {
    // _firebaseMessaging.requestNotificationPermissions(); // For IOS Permissions
    if (Platform.isIOS) {
      _firebaseMessaging
          .requestNotificationPermissions(IosNotificationSettings());
    }

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        // If APP Is Opend.
        showNotification(
            body: "${message["data"]["body"]}",
            title: "${message["data"]["title"]} ");

        print("DATA :::::::: DOWN");

        print('onMessage ==== ? ${message}');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume =============================');

        print('onResume ==== ? $message');
        print('onResume =============================');
        print('onResume =============================');

        _notificationsPageProvider.fetchNotifications();
        Get.to(NotificationScreen());

        print('onResume =============================');
        print('onResume =============================');
      },
      // onBackgroundMessage: myBackgroundMessageHandler,

      onLaunch: (Map<String, dynamic> message) async {
        //   showNotification(body: "اشعار جديد", title: "onLaunch");
        print('onLaunch ===--------------=============');
        print('onLaunch ==== ? $message');

        _notificationsPageProvider.fetchNotifications();
        Get.to(NotificationScreen());
      },
    );
    // _firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    // _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
  }

  // void _serialiseAndNavigate(Map<String, dynamic> message) {
  //   var notificationData = message['data'];
  //   var view = notificationData['view'];
  //
  //   if (view != null) {
  //     // Navigate to the create post view
  //
  //     // if (view == 'create_post') {
  //     //   _navigationService.navigateTo(CreatePostViewRoute);
  //     // }
  //
  //     // If there's no view it'll just open the app on the first view
  //   }
  // }
}
