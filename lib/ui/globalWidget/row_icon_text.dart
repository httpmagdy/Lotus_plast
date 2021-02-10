import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class RowIconText extends StatelessWidget {
  final String text, iconName;
  final textColor;
  final double textSize;

  RowIconText({this.text, this.textColor, this.iconName, this.textSize});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconName != null
              ? 'assets/img/icons/$iconName.png'
              : 'assets/img/icons/prof.png',
          width: ScreenHelper.screenWidth(context, 12),
          height: ScreenHelper.screenHeight(context, 12),
        ),
        CustomText(
          padding: EdgeInsets.only(right: 5),
          text: '$text',
          color: textColor ?? ConstColors.OPACITY_WHITE,
          fontSize: textSize ?? ScreenHelper.screenFont(context, 12.5),
        ),
      ],
    );
  }
}
