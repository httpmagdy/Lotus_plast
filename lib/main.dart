import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'ui/onboarding/onboarding_screen.dart';
import 'ui/screen/Customer/home_customer.dart';
import 'ui/screen/Inspector/home_inspector.dart';
import 'ui/screen/Plumber/home_screen.dart';
import 'ui/screen/auth_Screens/Forget_Password/forget_password_scren.dart';
import 'ui/screen/auth_Screens/welcome_screen.dart';
import 'Bloc/Controllers/Notifications_Management/firebase_notifications.dart';
import 'Bloc/Controllers/Notifications_Management/local_notifications_provider.dart';
import 'utils/constants.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  GetStorage box = GetStorage("onBoarding");
  GetStorage logged = GetStorage();

  await GetStorage.init();
  app(box, logged);
  runApp(MyApp());
}

var homeScreen;

app(box, logged) async {
  var _seen = await box.read("onBoarding");
  var _logged = await logged.read("typeUser");
  var _isVerify = await logged.read("phoneVerify");

  print("Sen On Boarding :: $_seen");
  print("Is Logged :::: typeUser :::: $_logged");

  if (_seen == null) {
    homeScreen = OnBoardingScreen();
  } else if (_seen == true) {
    if (_logged != null) {
      print("(main) verify is ISSSSSSSSSSSSSSSSS $_isVerify ");

      if (_isVerify == 0) {
        homeScreen = WelcomeScreen();

        print(" In file (main) verify is No $_isVerify ");
      } else {
        if (_logged == 0) {
          homeScreen = HomeScreenPlumber();
        } else if (_logged == 1) {
          homeScreen = HomeCustomer();
        } else if (_logged == 2) {
          homeScreen = HomeInspector();
        } else {}
      }
    } else {
      print(
          'NOT AUTH ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ $_logged');
      homeScreen = WelcomeScreen();
    }
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PushNotificationManger _pushNotificationManger =
      Get.put(PushNotificationManger());
  // StreamSubscription subscription;

  @override
  void initState() {
    _pushNotificationManger.configureCallback();
    localNotification();
    // subscription = Connectivity().onConnectivityChanged.listen(showConnectivty);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar', 'AE'),
      title: 'Lutas',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        buttonColor: ConstColors.MAIN_COLOR,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: "cairo_bold", color: ConstColors.BLACK_COLOR),
          subtitle1: TextStyle(
              fontFamily: "cairo_regular", color: ConstColors.GREY_COLOR),
          headline2:
              TextStyle(fontFamily: "cairo_semibold", color: Colors.white),
          subtitle2: TextStyle(
              fontFamily: "cairo_light", color: ConstColors.GREY_COLOR),
        ),
      ),

      home: homeScreen,
      // home: ForgrtPasswordScreen(),
    );
  }
}
