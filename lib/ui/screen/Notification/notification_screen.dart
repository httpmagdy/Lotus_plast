import 'package:flutter/material.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        onPressed: () {},
        transparent: false,
        isHome: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        children: [
          NotificationCard(),
          NotificationCard(),
          NotificationCard(),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenHelper.screenWidth(context, 6),
      ),
      decoration: BoxDecoration(
        color: ConstColors.ULTRA_GREY_COLOR,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenHeight(context, 15),
              vertical: ScreenHelper.screenWidth(context, 15),
            ),            child: Row(
              children: [

                CircleAvatar(
                  backgroundColor: ConstColors.WHITE.withOpacity(.8),
                  // backgroundImage: AssetImage("assets/img/tab4.png"),
                  child:  Icon(Icons.notifications_none_sharp, size: 24, color: ConstColors.ORANGE_COLOR,),
                ),

                SizedBox(
                  width: ScreenHelper.screenWidth(context, 12),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ScreenHelper.screenSize(context).width *.7,
                      child: CustomText(
                        text: "اشعار جديد",
                        fontW: FW.semibold,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      width: ScreenHelper.screenSize(context).width *.7,
                      padding: EdgeInsets.only(bottom: 8),
                      child: CustomText(
                        text: "يوجد  معاينة جديدة في منمعاينة جديدة ف جديدة ف جديدة في منمعاينة جمنمعاينة جديدة في منطقة قريبة منك ",
                        // fontSize: 12,
                        color: ConstColors.TEXT_GREY2,
                      ),

                    ),

                  ],
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenHeight(context, 7),
              vertical: ScreenHelper.screenWidth(context, 4),
            ),
            child: CustomText(
              text: " 09:20 AM ",
               color: ConstColors.TEXT_GREY2.withOpacity(.5),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}