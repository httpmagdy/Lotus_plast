import 'package:flutter/material.dart';

class ScreenHelper {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context, double factor) {
    return (factor / 812) * MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context, double factor) {
    return (factor / 375) * MediaQuery.of(context).size.width;
  }

  static double screenFont(BuildContext context, double factor) {
    return (factor / 450) * MediaQuery.of(context).size.width;
  }

  static double screenRadius(BuildContext context, double factor) {
    return (factor / 400) * MediaQuery.of(context).size.width;
  }
}
