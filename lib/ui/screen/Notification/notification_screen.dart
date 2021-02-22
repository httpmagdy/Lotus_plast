import 'package:flutter/material.dart';
import 'package:lotus/Bloc/Controllers/Notifications_Management/notify_manage.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';
import '../../../Bloc/Controllers/Notifications_Management/notifications_page_provider.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationsPageProvider n = Get.put(NotificationsPageProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        onPressed: () {},
        transparent: false,
        isHome: false,
      ),
      body: GetX<NotificationsPageProvider>(
        // init: NotificationsPageProvider(),
        builder: (controller) {
          print("4  controller.loading.value ${controller.loading.value}");
       return   controller.loading.value
              ? CustomLoading(
            bg: Colors.white,
          )
              : RefreshIndicator(
            color: ConstColors.ORANGE_COLOR,
            onRefresh: () async {
              await controller.fetchNotifications();
            },
            child: controller.status.value == false ? Center(child: CustomText(text: "ليس لديك اشعارات حاليا !",color: ConstColors.GREY_COLOR,),) : ListView.builder(
              itemCount: controller.myNotifications.length,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              itemBuilder: (context, index) => NotificationCard(
                id: controller.myNotifications[index].data.data.id,
                time: controller.myNotifications[index].data.data.time,
                title: controller.myNotifications[index].data.data.title,
                body: controller.myNotifications[index].data.data.body,
                notifyType: controller.myNotifications[index].data.data.type,
              ),
            ),
          );
        }
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  // final HomeInspectorProvider _inspectorProvider = Get.find();

  final String title, body, time, notifyType;
  final int id;

  NotificationCard({this.title, this.body, this.time, this.id, this.notifyType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{

        print("notifyType //===========($notifyType)");


        print("Im Clicdddddddd +++");
        await NotifyManage().notifyManage(id: id, notifyType: notifyType);
        print("Im Clicdddddddd ====");



        // var goTo = _inspectorProvider.getInspectById(id);a
        // print(goTo.id);
        //
        // Get.to(ReportPreviewInspector(goTo));

      },
      child: Container(
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
                horizontal: 15,
                vertical: 15,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: ConstColors.WHITE.withOpacity(.8),
                    // backgroundImage: AssetImage("assets/img/tab4.png"),
                    child: Icon(
                      Icons.notifications_none_sharp,
                      size: 24,
                      color: ConstColors.ORANGE_COLOR,
                    ),
                  ),
                  SizedBox(
                    width: ScreenHelper.screenWidth(context, 12),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ScreenHelper.screenSize(context).width * .65,
                        child: CustomText(
                          text: "$title",
                          fontW: FW.semibold,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: ScreenHelper.screenSize(context).width * .65,
                        padding: EdgeInsets.only(bottom: 8),
                        child: CustomText(
                          text: "$body",
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
                text: "$time",
                color: ConstColors.TEXT_GREY2.withOpacity(.5),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
