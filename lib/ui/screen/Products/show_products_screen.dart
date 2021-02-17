import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class ShowProductsScreen extends StatelessWidget {
  final bool haveAppbar;
  ShowProductsScreen({this.haveAppbar = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: haveAppbar ? customAppBar(context: context,isHome: false) : null,

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.screenWidth(context, 25),
          vertical: 20,
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/img/showProducts.png",
              // height: ScreenHelper.screenHeight(context, 249),
              width: ScreenHelper.screenWidth(context, 320),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 23),
            ),
            CustomText(
              text: "عرض المنتجات",
              fontSize: ScreenHelper.screenFont(context, 25),
              fontW: FW.bold,
            ),
            CustomText(
              text: "لتتمكن من رؤية  المنتجات قم بتحميل الملف ",
              fontSize: ScreenHelper.screenFont(context, 10),
            ),
            SizedBox(
              height: 50,
            ),
            SimpleCustomButton(
              text: 'تنزيل الملف',
              onTap: () async{

                final status = await Permission.storage.request();

                if(status.isGranted){

                  final externalDir = await getExternalStorageDirectory();

                  await FlutterDownloader.enqueue(
                    url:
                    "https://firebasestorage.googleapis.com/v0/b/storage-3cff8.appspot.com/o/2020-05-29%2007-18-34.mp4?alt=media&token=841fffde-2b83-430c-87c3-2d2fd658fd41",
                    savedDir: externalDir.path,
                    fileName: "products",
                    showNotification: true,
                    openFileFromNotification: true,
                  );

                }
              },
              // bgColor: ConstColors.GREEN_COLOR,
            ),
          ],
        ),
      ),
    );
  }
}
