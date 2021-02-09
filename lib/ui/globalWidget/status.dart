import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class StatusW extends StatelessWidget {
  final state;
  StatusW(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: state == 0 ? ConstColors.ORANGE_COLOR.withOpacity(0.16) : ConstColors.GREEN_COLOR.withOpacity(0.16),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 8),
      child: CustomText(
        padding: EdgeInsets.only(right: 5),
        text: state == 0 ? "قيد التقديم" : "تمت بنجاح",
        color:  state == 0 ? ConstColors.ORANGE_COLOR :  ConstColors.MAIN_COLOR ,
        fontSize: ScreenHelper.screenFont(context, 11),
      ),
    );
  }
}
