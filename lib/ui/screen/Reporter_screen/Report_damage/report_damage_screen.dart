import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lotus/Bloc/Controllers/qr_provider.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/custom_radio_list_builder.dart';
import 'package:lotus/ui/screen/Plumber/points.dart';
import 'package:lotus/ui/screen/ReportADamage/report_a_damage.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/ui/widget/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:lotus/utils/constants.dart';
import 'dart:io';

class ReportDamageScreen extends StatefulWidget {
  @override
  _ReportDamageScreenState createState() => _ReportDamageScreenState();
}

class _ReportDamageScreenState extends State<ReportDamageScreen> {
  final QrProvider _qrProvider = Get.put(QrProvider());
  TextEditingController _textController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _textController.dispose();
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context, 25),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(
                "assets/img/showProducts.png",
                width: ScreenHelper.screenWidth(context, 328),
              ),
              CustomText(
                text: "تقرير العطل",
                fontSize: 25,
                fontW: FW.bold,
              ),
              CustomText(
                text: "اكتب وصفك للعطل الذي قمت بمعايتنه",
                fontSize: 10,
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 31),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/img/icons/prof.png",
                              height: ScreenHelper.screenHeight(context, 10),
                              width: ScreenHelper.screenWidth(context, 10),
                            ),
                            SizedBox(
                              width: ScreenHelper.screenWidth(context, 4),
                            ),
                            CustomText(
                              text: "اسم  السباك ",
                              fontSize: 9,
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 15),
                        ),
                        CustomText(
                          text: "محمد احمد",
                          fontSize: 12,
                          fontW: FW.bold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/img/icons/phone-line(1).png",
                              height: ScreenHelper.screenHeight(context, 12),
                              width: ScreenHelper.screenWidth(context, 12),
                            ),
                            SizedBox(
                              width: ScreenHelper.screenWidth(context, 4),
                            ),
                            CustomText(
                              text: "رقم الهاتف",
                              fontSize: 9,
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 15),
                        ),
                        CustomText(
                          text: "0100000500",
                          fontSize: 12,
                          fontW: FW.bold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/img/icons/edite_icon.png",
                              height: ScreenHelper.screenHeight(context, 7.2),
                              width: ScreenHelper.screenWidth(context, 7.2),
                            ),
                            SizedBox(
                              width: ScreenHelper.screenWidth(context, 4),
                            ),
                            CustomText(
                              text: "تعديل",
                              fontSize: 11,
                              color: Color(0xFFFC8400),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 12),
                        ),
                        InkWell(
                          onTap: () {
                            _qrProvider.scanQR().whenComplete(
                              () {
                                print(
                                    'WQWQWQWQWQWQWQWQW ${_qrProvider.scanQrCode}');

                                if (_qrProvider.scanQrCode == '-1') {
                                  print(
                                      'QRRRRRRRRR ::::::::${_qrProvider.scanQrCode}');
                                } else {
                                  Get.dialog(
                                    DialogPoint(
                                      image: 'assets/img/tab1.png',
                                      title: 'اضافة النقاط الي رصيد',
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: ScreenHelper.screenHeight(
                                            context, 180),
                                        child: RadioListBuilder(),
                                      ),
                                      buttonName: 'حفظ',
                                      onTapOk: () {
                                        Get.back();
                                        Get.dialog(
                                          OkDialog(
                                            title: 'تم تسجيل كوبوناتك بنجاح',
                                            image: 'assets/img/okicon.png',
                                            body: 'تم اضافة ٥٠ نقطة الي رصيدك',
                                            onTapOk: () {},
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              },
                            );
                          },
                          child: Image.asset(
                            "assets/img/scanCode.png",
                            height: ScreenHelper.screenHeight(context, 42),
                            width: ScreenHelper.screenWidth(context, 42),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context, 10)),
                    child: Stack(
                      children: [
                        CustomTextField(
                          horizentalPadding: 25,
                          maxLines: 2,
                          verticalPadding: 14,
                          hint: "وصف المعاينه",
                          controller: _textController,
                        ),
                        Positioned(
                          top: ScreenHelper.screenHeight(context, 12),
                          left: ScreenHelper.screenWidth(context, 12),
                          child: InkWell(
                            onTap: getImage,
                            child: _image == null
                                ? Icon(
                                    Icons.camera_alt_outlined,
                                    size:
                                        ScreenHelper.screenSize(context).width *
                                            0.060,
                                    color: ConstColors.FORM_COLOR,
                                  )
                                : SelectedCameraImage(image: _image),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 50),
              ),
              SimpleCustomButton(
                text: "وصف المعاينه",
                onTap: () {},
                bgColor: Color(0xFF99D521),
                width: 320,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
