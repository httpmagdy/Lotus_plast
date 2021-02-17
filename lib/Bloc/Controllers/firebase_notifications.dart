import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/models/home_customer_tabs_model.dart';
import '../../ui/widget/custom_dialog.dart';
import 'dart:io';



Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  print("dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
}

class PushNotificationManger {
  // single tone
  PushNotificationManger._();
  factory PushNotificationManger() => _instance;
  static PushNotificationManger _instance = PushNotificationManger._();



  // Future onDidReceiveLocalNotification(
  //     int id, String title, String body, String payload) async {
  //   // display a dialog with the notification details, tap ok to go to another page
  //
  //   Get.dialog(OkDialog(title: title, body: body,));
  // }

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
    print("============");
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();

  void localNotification() {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings android =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings iOS = IOSInitializationSettings(
        // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
        );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: android,
      iOS: iOS,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

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
        showNotification(body: "اشعار جديد", title: "onMessage");

        // print('onMessage ==== ? ${message}');

        print('onMessage ==== ? ${message["data"]["body"]}');

        Allprview extractData = Allprview.fromJson(message["data"]["body"]);

        print("on Messa==== ?>>> ${extractData.address}");

        // print('onMessage ==== 222222? ${message["data"]["body"]["pulmber_phone"]}');

        // var data = json.decode("$message");
        // Allprview ddd = Allprview.fromJson(message["data"]["body"]);
        //
        // print("DECODING DATA ::::::::::::::::::::::::::::::::::::: ${ddd.address}");

        showNotification(body: "اشعار جديد", title: "onMessage");

        // Get.dialog(OkDialog(title: "On Message", body: "on Message..",onTapOk: (){
        //   Get.back();
        // },) );
      },
      // onResume: (Map<String, dynamic> message) async {
      //   print('onResume =============================');
      //
      //   // print('onResume ==== ? $message');
      //   print('onResume =============================');
      //
      //   // showNotification(body: "اشعار جديد", title: "onResume");
      //
      //   Get.dialog(OkDialog(title: "On Resume", body: "on Resume Message..",onTapOk: (){
      //     Get.back();
      //   },) );
      //
      //
      // },
      onBackgroundMessage: myBackgroundMessageHandler,
     //  onLaunch: (Map<String, dynamic> message) async {
     // //   showNotification(body: "اشعار جديد", title: "onLaunch");
     //    print('onLaunch ==== ? $message');
     //
     //    // showNotification(body: "اشعار جديد", title: "onLaunch");
     //
     //    // Get.dialog(OkDialog(title: "On Launch", body: "on Launch Message..",onTapOk: (){
     //    //
     //    //   Get.back();
     //    //
     //    // }));
     //  },
    );
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
