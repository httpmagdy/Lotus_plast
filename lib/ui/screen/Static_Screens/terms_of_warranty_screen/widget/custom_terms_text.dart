import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';


class CustomTermsText extends StatelessWidget {
  const CustomTermsText({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.screenWidth(context, 300),
      child: CustomText(
        text:
        text,
        fontSize: ScreenHelper.screenFont(context, 15),
        color: ConstColors.GREY_COLOR,
      ),
    );
  }
}
