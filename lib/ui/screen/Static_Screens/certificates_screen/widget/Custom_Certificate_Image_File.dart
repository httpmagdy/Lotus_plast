import 'package:flutter/material.dart';

import '../../../../../helpers/screen_helper.dart';
import '../../../../../utils/constants.dart';
import '../../../../widget/custom_text.dart';

class CustomCertificateImageFile extends StatelessWidget {
  const CustomCertificateImageFile({this.image, this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: ScreenHelper.screenHeight(context, 210),
          width: ScreenHelper.screenWidth(context, 147),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 17),
        ),
        Container(
          width: ScreenHelper.screenWidth(context, 147),
          child: Center(
            child: CustomText(
              text: text,
              color: ConstColors.GREY_COLOR,
              fontSize: ScreenHelper.screenFont(context, 13),
            ),
          ),
        )
      ],
    );
  }
}
