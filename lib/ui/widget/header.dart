import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/img/header.png"),
      height: ScreenHelper.screenHeight(context, 210),
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}
