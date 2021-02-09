import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/screen/Plumber/gifts_page.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class GiftBox extends StatelessWidget {
  const GiftBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
   onTap: (){
     Get.to(GiftsPage());
   },
      child: Container(
        // margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
        // padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 15),
        // width: ScreenHelper.screenSize(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ConstColors.WHITE,
          // border: Border.all(width: 0.8, color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              spreadRadius: 0.4,
              offset: Offset(0.1, 2.4),
              color: ConstColors.GREY_COLOR.withOpacity(0.5),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/img/gifthome.png',
              width: ScreenHelper.screenWidth(context, 42),
              height: ScreenHelper.screenHeight(context, 42),
            ),
            // CustomText(
            //   text: 'مكافئاتك',
            //   fontSize: 12,
            // ),
          ],
        ),
      ),
    );
  }
}
