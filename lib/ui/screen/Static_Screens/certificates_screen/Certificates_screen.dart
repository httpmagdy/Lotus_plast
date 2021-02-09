import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/screen/Static_Screens/certificates_screen/widget/Custom_Certificate_Image_File.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_text.dart';

class CertificatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          onPressed: () {},
          transparent: false,
          isHome: false),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.screenWidth(context, 22),
          vertical: ScreenHelper.screenHeight(context, 11),
        ),
        children: [
          CustomText(
            text: "الشهادات",
            fontW: FW.bold,
            fontSize: 20,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 48),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCertificateImageFile(
                      image: "assets/img/CertificateImage1.png",
                      text: "هذا النص هو مثال لنص "
                  ),
                  CustomCertificateImageFile(
                      image: "assets/img/CertificateImage1.png",
                      text: "هذا النص هو مثال لنص ",),
                ],
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 48),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCertificateImageFile(
                      image: "assets/img/CertificateImage1.png",
                      text: "هذا النص هو مثال لنص "
                  ),
                  CustomCertificateImageFile(
                      image: "assets/img/CertificateImage1.png",
                      text: "هذا النص هو مثال لنص "),
                ],
              ),
            ],

          ),
        ],
      ),
    );
  }
}
