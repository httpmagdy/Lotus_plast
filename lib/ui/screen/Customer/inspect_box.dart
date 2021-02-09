import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/row_icon_text.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class InspectBox extends StatelessWidget {
  final onTap;

  InspectBox({this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: ScreenHelper.screenSize(context).width,
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
            Row(
              children: [
                Image.asset(
                  'assets/img/ccc1.png', // ccc1
                  width: ScreenHelper.screenWidth(context, 60),
                  height: ScreenHelper.screenHeight(context, 60),
                ),
                CustomText(
                  padding: EdgeInsets.only(
                      right: ScreenHelper.screenWidth(context, 5)),
                  text: 'معاينه اليوم',
                  fontSize: ScreenHelper.screenFont(context, 20),
                  fontW: FW.bold,
                ),
              ],
            ),
            Padding(
              padding:
              EdgeInsets.only(right: ScreenHelper.screenWidth(context, 65)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    padding: EdgeInsets.only(
                        bottom: ScreenHelper.screenWidth(context, 5),
                        top: ScreenHelper.screenWidth(context, 5)),
                    text: 'معلومات المعاين',
                    fontSize: ScreenHelper.screenFont(context, 12.5),
                    fontW: FW.bold,
                    color: ConstColors.TEXT_GREY2,
                  ),
                  Row(
                    children: [
                      RowIconText(
                        text: '20/1/2020',
                        textColor: ConstColors.TEXT_GREY2,
                      ),
                      SizedBox(width: ScreenHelper.screenWidth(context, 50)),
                      RowIconText(
                        text: '9:00am',
                        textColor: ConstColors.TEXT_GREY2,
                      ),
                    ],
                  ),
                  CustomText(
                    padding: EdgeInsets.only(
                        bottom: ScreenHelper.screenWidth(context, 5),
                        top: ScreenHelper.screenWidth(context, 10)),
                    text: 'معلومات السباك',
                    fontSize: ScreenHelper.screenFont(context, 12.5),
                    fontW: FW.bold,
                    color: ConstColors.TEXT_GREY2,
                  ),
                  Row(
                    children: [
                      RowIconText(
                        text: 'يوسف علي',
                        textColor: ConstColors.TEXT_GREY2,
                      ),
                      SizedBox(width: ScreenHelper.screenWidth(context, 50)),
                      RowIconText(
                        text: '0122555222',
                        textColor: ConstColors.TEXT_GREY2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(top: ScreenHelper.screenHeight(context, 20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowIconText(
                    text: '9:00 ص',
                    textColor: ConstColors.TEXT_GREY2,
                  ),
                  RowIconText(
                    text: '20/1/2020',
                    textColor: ConstColors.TEXT_GREY2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
