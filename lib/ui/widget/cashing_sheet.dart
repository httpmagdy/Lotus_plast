import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/Plumber/cobones_plumber_provider.dart';
import 'package:lotus/Bloc/Controllers/Plumber/when_exchange_coupons.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/utils/constants.dart';

import 'custom_button.dart';
import 'custom_dialog.dart';
import 'custom_text.dart';
import 'custom_text_field.dart';

class TypeCashModel {
  final String type;
  final int id;
  TypeCashModel({this.type, this.id});
}

class CashingSheet extends StatefulWidget {
  const CashingSheet({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  _CashingSheetState createState() => _CashingSheetState();
}

class _CashingSheetState extends State<CashingSheet> {
  WhenExchangeCouponsProvider _whenExchangeCouponsProvider =
      Get.put(WhenExchangeCouponsProvider());


  final CobonesPlumberProvider _cobonesPlumberProvider =
  Get.put(CobonesPlumberProvider());
  bool passwordSecure = false;
  String selectError = "محفظه الكترونيه";

  List<TypeCashModel> _error = [
    TypeCashModel(id: 0, type: "محفظه الكترونيه"),
    TypeCashModel(id: 1, type: "كاش"),
  ];

  @override
  Widget build(BuildContext context) {
    print('selectError :::: $selectError ,,,,');
    return Container(
      height: ScreenHelper.screenSize(context).height * 0.7,
      decoration: BoxDecoration(
        color: ConstColors.WHITE,
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 6.0,
        //     spreadRadius: 0.4,
        //     offset: Offset(0.1, 0.5),
        //     color: ConstColors.GREY_COLOR,
        //   ),
        // ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context, 25),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: widget.title ?? '',
                  fontSize: 20,
                  fontW: FW.bold,
                  padding: EdgeInsets.only(
                    bottom: ScreenHelper.screenHeight(context, 40),
                    top: ScreenHelper.screenHeight(context, 35),
                  ),
                ),
                CustomTextField(
                  // prefixIcon: "assets/img/icons/prof.png",
                  hint: "القيمة المالية",
                  keyboardType: TextInputType.number,
                  controller: _whenExchangeCouponsProvider.priceController,
                  errorMessage: 'price',
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 25),
                ),
                // CustomTextField(
                //   // prefixIcon: "assets/img/icons/phone-line(1).png",
                //   hint: "محفظة الكترونية",
                //   // controller: _phoneController,
                // ),
                Container(
                  height: 50,
                  // width: ScreenHelper.screenWidth(context, 313),
                  decoration: BoxDecoration(
                    border: Border.all(color: ConstColors.FORM_COLOR, width: 1),
                    borderRadius: BorderRadius.circular(
                        ScreenHelper.screenRadius(context, 28.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context, 18)),
                    child: DropdownButton(
                      hint: CustomText(text: "محفظه الكترونيه"),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36.0,
                      isExpanded: true,
                      underline: Container(color: Colors.transparent),
                      value: selectError,
                      items: _error.map((value) {
                        return DropdownMenuItem(
                          value: value.type,
                          child: CustomText(text: value.type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectError = value;

                          _whenExchangeCouponsProvider.typeId.value =
                              _error.firstWhere((e) => e.type == value).id;
                          // selectError = value.id;
                          print(
                              'typeId :::: ${_whenExchangeCouponsProvider.typeId.value}}');

                          print('selectError :::: $selectError ,,');
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 25),
                ),
                if (selectError == "محفظه الكترونيه")
                  CustomTextField(
                    // prefixIcon: "assets/img/icons/phone-line(1).png",
                    hint: "ادخل رقم المحفظة",
                    keyboardType: TextInputType.number,
                    controller:
                        _whenExchangeCouponsProvider.wallerNumberController,
                    errorMessage: 'waller',
                  )
                else
                  Container(),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 60),
                ),
                // Spacer(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SimpleCustomButton(
                //       text: 'صرف',
                //       width: ScreenHelper.screenSize(context).width * 0.32,
                //       onTap: () {
                //         Get.dialog(
                //           CustomDialog(
                //             image: 'assets/img/tab1.png',
                //             body: 'هل انت متاكد من رغبتك في صرف النقاط؟',
                //             onTapYes: () {
                //               Get.back();
                //               Get.back();
                //               Get.dialog(
                //                 OkDialog(
                //                   title: 'تم صرف النقاط بنجاح',
                //                   image: 'assets/img/okicon.png',
                //                   body: 'سيتم التواصل معك في خلال ٢٤ ساعه',
                //                   onTapOk: () {
                //                     Get.back();
                //                   },
                //                 ),
                //               );
                //             },
                //           ),
                //         );
                //       },
                //     ),
                //     SimpleCustomButton(
                //       text: 'العوده',
                //       bgColor: ConstColors.WHITE,
                //       textColor: ConstColors.ORANGE_COLOR,
                //       width: ScreenHelper.screenSize(context).width * 0.32,
                //       onTap: () {
                //         Get.back();
                //       },
                //     ),
                //
                //   ],
                // ),
                SimpleCustomButton(
                  text: 'صرف',
                  width: ScreenHelper.screenSize(context).width,
                  onTap: () async {
                    Get.back();
                    await _whenExchangeCouponsProvider
                        .exchangeCoupons()
                        .then((value) async{
                      print(' :::::::::::::::::::::::::::::: ${value.status}');
                      if (value.status) {
                        await  _cobonesPlumberProvider.getCobones().whenComplete(() {
                          Get.dialog(OkDialog(
                            title: 'تم صرف النقاط بنجاح',
                            image: 'assets/img/okicon.png',
                            body: 'سيتم التواصل معك في خلال ٢٤ ساعه',
                            onTapOk: () {
                              Get.back();
                            },
                          ));
                        });

                      } else if (value.status == false) {
                        Get.dialog(OkDialog(
                          title: 'فشل صرف النقاط',
                          image: 'assets/img/okicon.png',
                          body: '${value.message}',
                          onTapOk: () {
                            Get.back();
                          },
                        ));
                      }
                    });

                    // Get.dialog(
                    //   CustomDialog(
                    //     image: 'assets/img/tab1.png',
                    //     body: 'هل انت متاكد من رغبتك في صرف النقاط؟',
                    //     onTapYes: () async {

                    //       // Get.back();
                    //       // Get.back();
                    //       // Get.dialog(
                    //       //   OkDialog(
                    //       //     title: 'تم صرف النقاط بنجاح',
                    //       //     image: 'assets/img/okicon.png',
                    //       //     body: 'سيتم التواصل معك في خلال ٢٤ ساعه',
                    //       //     onTapOk: () {
                    //       //       Get.back();
                    //       //     },
                    //       //   ),
                    //       // );
                    //     },
                    //   ),
                    // );
                  },
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 35),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
