import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Bloc/Controllers/Plumber/add_blumber_coupon_qr_provider.dart';
import '../../../Bloc/Controllers/Plumber/cobones_plumber_provider.dart';
import '../../../Bloc/Controllers/Plumber/scan_coupon_qr_provider.dart';
import '../../../Bloc/Controllers/qr_provider.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../globalWidget/custom_radio_list_builder.dart';
import '../../widget/cashing_sheet.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_dialog.dart';
import '../../widget/custom_text.dart';

class Points extends StatelessWidget {
  final bool haveAppbar;

  Points({this.haveAppbar = false});

  final QrProvider _qrProvider = Get.put(QrProvider());

  final CobonesPlumberProvider _cobonesPlumberProvider =
      Get.put(CobonesPlumberProvider());

  final ScanPlumberCouponQrProvider _scanPlumberCouponQrProvider =
      Get.put(ScanPlumberCouponQrProvider());

  final AddPlumberCouponQrProvider _addPlumberCouponQrProvider =
      Get.put(AddPlumberCouponQrProvider());

  final GetStorage _getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    var plumberCode = _getStorage.read('code');
    return Scaffold(
      appBar: haveAppbar ? customAppBar(context: context, isHome: false) : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomText(
              padding: EdgeInsets.only(
                top: ScreenHelper.screenHeight(context, 25),
              ),
              text: 'الكوبونات',
              fontSize: ScreenHelper.screenFont(context, 23),
              fontW: FW.bold,
              // color: ConstColors.GREEN_COLOR,
            ),
            Image.asset(
              'assets/img/poin.png',
              width: ScreenHelper.screenWidth(context, 250),
              height: ScreenHelper.screenHeight(context, 250),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: ScreenHelper.screenHeight(context, 25),
                bottom: ScreenHelper.screenHeight(context, 25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'كود السباك : $plumberCode',
                    fontSize: ScreenHelper.screenFont(context, 16),
                    fontW: FW.bold,
                    // color: ConstColors.GREEN_COLOR,
                  ),
                  GetBuilder<QrProvider>(
                    // init: QrProvider(),
                    builder: (_qr) => InkWell(
                      onTap: () async {
                        await _qr.scanQR().whenComplete(() {
                          _scanPlumberCouponQrProvider.qrCode.value =
                              _qr.scanQrCode;
                          _addPlumberCouponQrProvider.qrCode.value =
                              _scanPlumberCouponQrProvider.qrCode.value;

                          if (_scanPlumberCouponQrProvider
                              .qrCode.value.isEmpty) {
                            print(
                                'QRRRRRRRRR IS EMPTY ::::::::${_scanPlumberCouponQrProvider.qrCode.value.isEmpty}');
                          } else {
                            _scanPlumberCouponQrProvider
                                .scanPlumberCouponQr()
                                .then((value) {
                              if (value.status) {
                                Get.dialog(
                                  DialogPoint(
                                    image: 'assets/img/tab1.png',
                                    title: 'اضافة النقاط الي رصيد',
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: ScreenHelper.screenHeight(
                                          context, 180),
                                      child: RadioListBuilder(
                                        laterPrice: _scanPlumberCouponQrProvider
                                            .later.value,
                                        nowPrice: _scanPlumberCouponQrProvider
                                            .now.value,
                                      ),
                                    ),
                                    buttonName: 'حفظ',
                                    onTapOk: () async {
                                      Get.back();
                                      await _addPlumberCouponQrProvider
                                          .addPlumberCouponQr()
                                          .then((value) async {
                                        // Get.back();
                                        if (value.status == true) {
                                          await _cobonesPlumberProvider
                                              .getCobones()
                                              .whenComplete(() {
                                            Get.dialog(
                                              OkDialog(
                                                title:
                                                    'تم تسجيل كوبوناتك بنجاح',
                                                image: 'assets/img/okicon.png',
                                                body: '${value.message}',
                                                onTapOk: () {
                                                  Get.back();
                                                },
                                              ),
                                            );
                                          });
                                        } else {
                                          Get.dialog(
                                            OkDialog(
                                              title: 'فشل اضافه النقاط',
                                              image: 'assets/img/okicon.png',
                                              body: '${value.message}',
                                              onTapOk: () {
                                                Get.back();
                                              },
                                            ),
                                          );
                                          print(
                                              'ERRRRRRRR OR ADD POINTS ${value.status}');
                                        }
                                      });
                                    },
                                  ),
                                );
                              } else {
                                Get.dialog(OkDialog(
                                  title: 'فشل اضافه النقاط',
                                  image: 'assets/img/okicon.png',
                                  body: '${value.message}',
                                  onTapOk: () {
                                    Get.back();
                                  },
                                ));
                              }
                            });
                          }
                        });

                        print(
                            '_scanPlumberCouponQrProvider.qrCode.value ${_scanPlumberCouponQrProvider.qrCode.value}');
                      },
                      child: Image.asset(
                        "assets/img/scanCode.png",
                        height: ScreenHelper.screenHeight(context, 40),
                        width: ScreenHelper.screenWidth(context, 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // CustomText(
            //   text: 'يمكنك طلب اذن لصرف النقاط',
            //   fontSize: ScreenHelper.screenFont(context, 14),
            // ),
            // CustomText(
            //   padding: EdgeInsets.only(
            //     // bottom: ScreenHelper.screenHeight(context, 0),
            //   ),
            //   text: 'و تحديد القيمة المالية المراد صرفها',
            //   fontSize: ScreenHelper.screenFont(context, 14),
            // ),
            // const SizedBox(height: 15),

            GetX<CobonesPlumberProvider>(
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GiftWidget(
                        icon: 'gift1.png',
                        title: 'المبلغ المقابل',
                        colorNum: ConstColors.GREEN_COLOR,
                        pointNum: '${_cobonesPlumberProvider.nowValue}',
                        cpText: 'جنيه',
                      ),
                      Image.asset(
                        "assets/img/arrows.png",
                        // height:
                        // ScreenHelper.screenHeight(context, 40),
                        width: ScreenHelper.screenWidth(context, 40),
                      ),
                      GiftWidget(
                        icon: 'gift2.png',
                        title: 'الكوبونات الحاليه',
                        colorNum: ConstColors.ORANGE_COLOR,
                        pointNum: '${'${_cobonesPlumberProvider.nowCount}'}',
                        cpText: 'كوبون',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GiftWidget(
                        icon: 'gift1.png',
                        title: 'المبلغ المقابل',
                        colorNum: ConstColors.GREEN_COLOR,
                        pointNum: '${_cobonesPlumberProvider.laterValue}',
                        cpText: 'جنيه',
                      ),
                      Image.asset(
                        "assets/img/arrows.png",
                        // height:
                        // ScreenHelper.screenHeight(context, 40),
                        width: ScreenHelper.screenWidth(context, 40),
                      ),
                      GiftWidget(
                        icon: 'gift2.png',
                        title: 'كوبونات اخر العام',
                        colorNum: ConstColors.ORANGE_COLOR,
                        pointNum: '${_cobonesPlumberProvider.laterCount}',
                        cpText: 'كوبون',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

            Padding(
              padding: EdgeInsets.only(
                left: ScreenHelper.screenHeight(context, 20),
                right: ScreenHelper.screenHeight(context, 20),
              ),
              child: SimpleCustomButton(
                width: ScreenHelper.screenSize(context).width,
                text: 'صرف النقاط',
                onTap: () {
                  Get.bottomSheet(
                    CashingSheet(title: 'اذن صرف النقاط'),
                  );
                },
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 25),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(height: 200, child: RadioListBuilder()),

class GiftWidget extends StatelessWidget {
  final String icon, pointNum, title, cpText;
  final colorNum;

  const GiftWidget(
      {Key key,
      @required this.icon,
      this.pointNum,
      this.title,
      this.colorNum,
      this.cpText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/img/icons/$icon',
                  width: ScreenHelper.screenWidth(context, 20),
                  height: ScreenHelper.screenHeight(context, 20),
                ),
                const SizedBox(width: 5),
                CustomText(
                  text: '$pointNum',
                  fontSize: ScreenHelper.screenFont(context, 20),
                  fontW: FW.bold,
                  color: colorNum,
                ),
                CustomText(
                  padding: EdgeInsets.only(top: 6, right: 3),
                  text: '$cpText',
                  fontSize: ScreenHelper.screenFont(context, 11),
                ),
              ],
            ),
            CustomText(
              text: '$title',
              fontSize: ScreenHelper.screenFont(context, 13),
              // fontW: FW.semibold,
            ),
          ],
        ),
      ],
    );
  }
}
