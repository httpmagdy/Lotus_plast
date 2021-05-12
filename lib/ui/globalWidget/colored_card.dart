import 'package:flutter/material.dart';

import '../../helpers/screen_helper.dart';
import '../../utils/constants.dart';
import '../widget/custom_text.dart';
import 'row_icon_text.dart';

class ColordCard extends StatelessWidget {
  final bgColor;
  final String name, address, phone;
  const ColordCard({
    Key key,
    this.bgColor,
    this.name,
    this.address,
    this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      width: ScreenHelper.screenWidth(context, 250),
      // height: ScreenHelper.screenHeight(context, 150),
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomLeft,
        //   colors: [Color(0xffB7F645), Color(0xff92CD28)],
        // ),
        // borderRadius: BorderRadius.circular(8),
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenHelper.screenWidth(context, 30)),
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ConstColors.WHITE,
              border: Border.all(
                width: 0.8,
                color: Colors.grey.shade300,
              ),
            ),
            height: ScreenHelper.screenHeight(context, 40),
            width: ScreenHelper.screenWidth(context, 35),
            child: Icon(Icons.person),
          ),
          SizedBox(height: ScreenHelper.screenHeight(context, 15)),
          RowIconText(text: 'اسم العميل'),
          CustomText(
            text: '$name',
            color: ConstColors.WHITE,
            padding:
                EdgeInsets.only(bottom: ScreenHelper.screenHeight(context, 10)),
          ),
          RowIconText(text: 'رقم العميل'),
          CustomText(
            text: '$phone',
            color: ConstColors.WHITE,
            padding:
                EdgeInsets.only(bottom: ScreenHelper.screenHeight(context, 10)),
          ),
          RowIconText(
            text: 'المحلة ش الجيش عمارة ٢١',
            textColor: ConstColors.WHITE,
          ),
        ],
      ),
    );
  }
}
