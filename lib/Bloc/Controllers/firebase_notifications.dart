
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'local_notifications_provider.dart';

// Future<dynamic> myBackgroundMessageHandler( message) {
//
//   print("on Background = = = = = == = === = = == = = ==> 1111111}");
//   print("onBack ${message["data"]["body"]}");
//   print("onBack ${message["data"]["title"]}");
//
//   showNotification(body: "${message["data"]["body"]}", title: "${message["data"]["title"]}");
// }


Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {

  if (message['data'] != null) {
    final data = message['data'];

    final title = data['title'];
    final body = data['body'];

    await _showNotificationWithDefaultSound(title, body);
  }

  return Future<void>.value();
}

Future _showNotificationWithDefaultSound(String title, String message) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id', 'channel_name', 'channel_description',
      importance: Importance.max, priority: Priority.high);
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(iOS:iOSPlatformChannelSpecifics, android: androidPlatformChannelSpecifics, );
  await flutterLocalNotificationsPlugin.show(
    0,
    '$title',
    '$message',
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}

class PushNotificationManger extends GetxController{
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
      showNotification(body: "${message["data"]["body"]}", title: "${message["data"]["title"]} ");

        // print('onMessage ==== ? ${message}');

        // var data = jsonDecode("$message");

        print("DATA :::::::: DOWN");
        // print("DATA :::::::: $data");

        print('onMessage ==== ? ${message}');

        // Allprview extractData = Allprview.fromJson(message["data"]["body"]);

        // print("on Messa==== ?>>> ${extractData.address}");

        // print('onMessage ==== 222222? ${message["data"]["body"]["pulmber_phone"]}');

        // Allprview ddd = Allprview.fromJson(message["data"]["body"]);
        //
        // print("DECODING DATA ::::::::::::::::::::::::::::::::::::: ${ddd.address}");
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume =============================');
        // showNotification(body: "${message["data"]["body"]}", title: "${message["data"]["title"]} on resume");

        print('onResume ==== ? $message');
        print('onResume =============================');

        // showNotification(body: "اشعار جديد?", title: "onResume");

        // Get.dialog(OkDialog(title: "On Resume", body: "on Resume Message..",onTapOk: (){
        //   Get.back();
        // },) );
      },
      onBackgroundMessage: myBackgroundMessageHandler,


     onLaunch: (Map<String, dynamic> message) async {
     //   showNotification(body: "اشعار جديد", title: "onLaunch");
        print('onLaunch ===--------------=============');
        print('onLaunch ==== ? $message');

        // showNotification(body: "${message["data"]["body"]}", title: "${message["data"]["title"]} on Launch");


       // Get.dialog(OkDialog(title: "On Launch", body: "on Launch Message..",onTapOk: (){
        //
        //   Get.back();
        //
        // }));
      },

    );
    // _firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    // _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
  }

  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      // Navigate to the create post view

      // if (view == 'create_post') {
      //   _navigationService.navigateTo(CreatePostViewRoute);
      // }

      // If there's no view it'll just open the app on the first view
    }
  }


}


// {notification: {title: "FMC", body: "noty"}, data: {click_action: FLUTTER_NOTIFICATION_CLICK, message: message}}


