import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Bloc/Controllers/Inspector/scan_Coupon_Qr_Provider.dart';
import '../../../Bloc/Controllers/qr_provider.dart';
import '../../../Bloc/models/get_plumber_account_model.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_dialog.dart';
import '../../widget/custom_text.dart';

class GetUserCodeScreen extends StatelessWidget {
  final GePlumberAccountModel data;

  GetUserCodeScreen(this.data);

  final QrProvider _qrProvider = Get.put(QrProvider());
  final ScanQrInspectorProvider _scanQrInspectorProvider =
      Get.put(ScanQrInspectorProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(isHome: false, context: context),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: ScreenHelper.screenHeight(context, 50)),
            WidgetDetals(
              typeNamed: 'السباك',
              name: "${data.data.pulmberName}",
              phone: "${data.data.pulmberPhone}",
              code: "${data.data.code}",
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 75),
            ),
            GetBuilder<QrProvider>(
              builder: (_qr) => SimpleCustomButton(
                width: ScreenHelper.screenWidth(context, 300),
                bgColor: ConstColors.GREEN_COLOR,
                onTap: () async {
                  print('000 :: ${_qr.scanQrCode}');

                  await _qr.scanQR().whenComplete(() async {
                    if (_qr.scanQrCode.isEmpty) {
                      print('EMPTY  ::::::::${_qr.scanQrCode}');
                    } else {
                      await _scanQrInspectorProvider
                          .scanQrInspector(_qr.scanQrCode)
                          .then((value) {
                        print("ccccccccccccccc ${value.message}");

                        Get.dialog(
                          OkDialog(
                            title: 'اضافه كوبون',
                            image: 'assets/img/okicon.png',
                            body: '${value.message}',
                            onTapOk: () {
                              Get.back();
                            },
                          ),
                        );
                      });
                    }
                  });

                  print('111 :: ${_qr.scanQrCode}');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'مسح الرمز',
                      fontSize: 14,
                      fontW: FW.bold,
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 8),
                    ),
                    Image.asset(
                      "assets/img/scanCode.png",
                      height: ScreenHelper.screenHeight(context, 30),
                      width: ScreenHelper.screenWidth(context, 30),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetDetals extends StatelessWidget {
  final String typeNamed, name, phone, code;
  final onEdit;
  final bool haveEdit;

  WidgetDetals(
      {this.typeNamed,
      this.name,
      this.phone,
      this.onEdit,
      this.haveEdit = false,
      this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 5),
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 20),
      // width: ScreenHelper.screenSize(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
      width: ScreenHelper.screenSize(context).width - 50,
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: "اسم  $typeNamed",
                fontSize: ScreenHelper.screenFont(context, 12),
                padding: EdgeInsets.only(left: 20),
              ),
              CustomText(
                text: "$name",
                fontSize: ScreenHelper.screenFont(context, 12),
                fontW: FW.bold,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "رقم الهاتف",
                fontSize: ScreenHelper.screenFont(context, 12),
                padding: EdgeInsets.only(left: 24),
              ),
              CustomText(
                text: "$phone",
                fontSize: ScreenHelper.screenFont(context, 12),
                fontW: FW.bold,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: "كود السباك",
                fontSize: ScreenHelper.screenFont(context, 12),
                padding: EdgeInsets.only(left: 24),
              ),
              CustomText(
                text: "$code",
                fontSize: ScreenHelper.screenFont(context, 12),
                fontW: FW.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
