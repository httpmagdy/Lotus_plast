import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../widget/custom_text.dart';

class CustomLoading extends StatefulWidget {
  final String loadingText;
  final Color bg;
  CustomLoading({this.loadingText, this.bg});

  @override
  _CustomLoadingState createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading>
    with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController fadeInController;

  Animation<double> animation;
  Animation<double> fadeInAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    fadeInController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    final curveAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);

    animation =
        Tween<double>(begin: -.12 * pi, end: .12 * pi).animate(curveAnimation)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed)
                animationController.reverse();
              else if (status == AnimationStatus.dismissed)
                animationController.forward();
            },
          );

    fadeInAnimation = Tween(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(parent: fadeInController, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fadeInController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fadeInController.forward();
        }
      });
    animationController.forward();
    fadeInController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        backgroundColor: widget.bg ?? Colors.black45,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: animation.value,
                child: FadeTransition(
                  opacity: fadeInAnimation,
                  child: Image.asset(
                    'assets/img/load.png',
                    width: 90,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomText(
                text: '${widget.loadingText ?? 'جاري التحميل...'} ',
                fontW: FW.semibold,
                fontSize: 12,
                color: ConstColors.GREEN_COLOR,
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: CustomText(
              //     text: 'جاري التحميل...',
              //     fontW: FW.semibold,
              //     fontSize: 12,
              //     color: ConstColors.GREEN_COLOR,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fadeInController.dispose();
    animationController.dispose();
    super.dispose();
  }
}
