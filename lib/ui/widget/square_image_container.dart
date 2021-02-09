import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Dart Packages
import 'dart:async';
import '../../helpers/screen_helper.dart';

// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers

class SquareImageContainer extends StatelessWidget {
  final double size;
  final ImageProvider image;
  final Color imageColor;
  final double raduis;

  SquareImageContainer(
      {@required this.size,
      @required this.image,
      this.imageColor,
      this.raduis});

  @override
  Widget build(BuildContext context) {
    return Container(
      //clipBehavior: Clip.hardEdge,
      width: ScreenHelper.screenWidth(context, double.parse(size.toString())),
      height: ScreenHelper.screenWidth(context, double.parse(size.toString())),
      decoration: BoxDecoration(
        color: Colors.transparent,
//        borderRadius: BorderRadius.all(
//            Radius.circular(ScreenHelper.screenRadius(context, raduis))),
        image: DecorationImage(
          image: image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
