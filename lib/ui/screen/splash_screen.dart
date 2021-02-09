// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:lutas/ui/screen/welcome_screen.dart';
// import '../onboarding/onboarding_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   GetStorage box = GetStorage("onBoarding");
//
//   // void initState() {
//   //   super.initState();
//   //
//   //   Timer(Duration(seconds: 3), () {
//   //     Get.offAll(
//   //         box.hasData("onBoarding") ? WelcomeScreen() : OnBoardingScreen());
//   //   });
//   //
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Image(
//         image: AssetImage("assets/img/1.png"),
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }
