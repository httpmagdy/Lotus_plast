import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Bloc/Controllers/Auth_Controllers/Phone_Auth/vreify.dart';
import 'ui/onboarding/onboarding_screen.dart';
import 'ui/screen/Customer/home_customer.dart';
import 'ui/screen/Inspector/home_inspector.dart';
import 'ui/screen/Plumber/home_screen.dart';
import 'ui/screen/auth_Screens/welcome_screen.dart';
import 'Bloc/Controllers/firebase_notifications.dart';
import 'ui/screen/verify_screen.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

  print("Sen On Boarding :: $_seen");
  print("Is Logged :: $_logged");

  if (_seen == null) {
    homeScreen = OnBoardingScreen();
  } else if (_seen == true) {
    if (_logged != null) {
      if (_logged == 0) {
        homeScreen = HomeScreenPlumber();
      } else if (_logged == 1) {
        homeScreen = HomeCustomer();
      } else if (_logged == 2) {
        homeScreen = HomeInspector();
      } else {}
    } else {
      print(
          'NOT AUTH ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ $_logged');
      homeScreen = WelcomeScreen();
    }
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// app()async{
//   var _seen =  await box.read("onBoarding");
//   print("BOOOOOOOOOOOOOOOOOOOOOOOX :: $_seen");
//
//   if(_seen == null){
//     return OnBoardingScreen();
//   }else if(_seen == true){
//     return WelcomeScreen();
//   }
// }
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PushNotificationManger _pushNotificationManger =
      PushNotificationManger();
  // StreamSubscription subscription;

  @override
  void initState() {
    _pushNotificationManger.configureCallback();
    _pushNotificationManger.localNotification();
    // subscription = Connectivity().onConnectivityChanged.listen(showConnectivty);

    super.initState();
  }

  // showConnectivty(ConnectivityResult result) {
  //   bool hasIntenet = result != ConnectivityResult.none;

  //   if (hasIntenet) {
  //     return 'u have internet';
  //   } else {
  //     return 'u have no internet';
  //   }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   subscription.cancel();
  // }
  @override
  Widget build(BuildContext context) {
    // print("BOOOOOOOOOOOOOOOOOOOOOOOX :: ${box.read("onBoarding")}");
    return GetMaterialApp(
      // builder: DevicePreview.appBuilder,
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

      // home: NavigationScreen(),
      // home: VerifyScreen(),
      // home: ReportDamageScreen(),
      // home: homeScreen,
      home:PhoneVerificationScreen("+20 01092341428"),
      // home: CustomLoading(),
    );
  }
}

// class ConnectivtyPage extends StatefulWidget {
//   @override
//   _ConnectivtyPageState createState() => _ConnectivtyPageState();
// }

// class _ConnectivtyPageState extends State<ConnectivtyPage> {
//   StreamSubscription subscription;

//   @override
//   void initState() {
//     super.initState();
//     subscription = Connectivity().onConnectivityChanged.listen(showConnectivty);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     subscription.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FlatButton(
//             onPressed: () async {
//               var result = await Connectivity().checkConnectivity();
//               var f = showConnectivty(result);
//               print(f);
//             },
//             child: Text('Connectivty')),
//       ),
//     );
//   }

//   showConnectivty(ConnectivityResult result) {
//     bool hasIntenet = result != ConnectivityResult.none;

//     if (hasIntenet) {
//       return 'u have internet';
//     } else {
//       return 'u have no internet';
//     }
//   }
// }



