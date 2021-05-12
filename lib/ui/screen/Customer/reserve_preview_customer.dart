import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Bloc/Controllers/Customer/add_preview_provider.dart';
import '../../../Bloc/Controllers/Customer/home_provider_customer.dart';
import '../../../Bloc/Controllers/Maps_Controller/geolocator_u.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../globalWidget/custom_loading.dart';
import '../../globalWidget/custom_snack_bar.dart';
import '../../globalWidget/row_icon_text.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_dialog.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_field.dart';
import '../Maps_Screens/get_u_location.dart';

class ReservePreviewCustomer extends StatefulWidget {
  @override
  _ReservePreviewCustomerState createState() => _ReservePreviewCustomerState();
}

class _ReservePreviewCustomerState extends State<ReservePreviewCustomer> {
  final GlobalKey<FormState> globalKeyPreview = GlobalKey<FormState>();

  // GetUserPosition _getUserPosition = Get.put(GetUserPosition());
  AddPreviewProvider _addPreviewProvider = Get.put(AddPreviewProvider());
  HomeCategoryCustomerProvider _homeCategoryCustomerProvider =
      Get.put(HomeCategoryCustomerProvider());
  GetStorage _box = GetStorage();

  bool _addNumber = false;

  @override
  Widget build(BuildContext context) {
    var userNameBox = _box.read('name');
    var phoneBox = _box.read('phone');

    print('STOOOOOOOOR :: $userNameBox');
    // print('LLLLOCAAAATHON :::: ${_getUserPosition.currentAddress}');
    var node = FocusScope.of(context);

    return Scaffold(
      appBar: customAppBar(
        context: context,
        onPressed: () {},
        transparent: false,
        isHome: false,
      ),
      body: GetBuilder<GetUserPosition>(
          init: GetUserPosition(),
          builder: (_dataPosition) {
            _addPreviewProvider.addressController.text =
                _dataPosition.currentAddress;
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Form(
                  key: globalKeyPreview,
                  child: ListView(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0, bottom: 80),
                    children: [
                      CustomText(
                        textAlign: TextAlign.center,
                        padding: EdgeInsets.only(top: 20),
                        text: "حجز معاينة",
                        fontW: FW.bold,
                        fontSize: 20,
                      ),
                      CustomText(
                        text: "ادخل بياناتك لتتمكن من حجز موعد المعاينة",
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 40),
                      ),

                      RowIconText(
                        text: '$userNameBox',
                        textColor: ConstColors.BLACK_COLOR,
                        textSize: 13.0,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RowIconText(
                            text: '$phoneBox',
                            textColor: ConstColors.BLACK_COLOR,
                            iconName: 'phone-line(1)',
                            textSize: 13.0,
                          ),
                          InkWell(
                            child: CustomText(
                              text: 'إضافة رقم اخر',
                              color: ConstColors.ORANGE_COLOR,
                              fontSize: 11,
                            ),
                            onTap: () {
                              setState(() {
                                _addNumber = true;
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 0),

                      _addNumber
                          ? Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: CustomTextField(
                                prefixIcon:
                                    "assets/img/icons/phone-line(1).png",
                                hint: " رقم الموبيل",
                                controller: _addPreviewProvider.phoneController,
                                keyboardType: TextInputType.phone,
                                // colorFocused: Colors.black,
                              ),
                            )
                          : Container(),

                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 20),
                      ),
                      CustomTextField(
                        prefixIcon: "assets/img/icons/prof.png",
                        hint: "اسم السباك",
                        controller: _addPreviewProvider.plumberNameController,
                        errorMessage: "يجب ادخال اسم السباك",

                        // colorFocused: Colors.black,
                      ),

                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 20),
                      ),
                      CustomTextField(
                        prefixIcon: "assets/img/icons/phone-line(1).png",
                        hint: " رقم الموبيل",
                        controller: _addPreviewProvider.plumberPhoneController,
                        keyboardType: TextInputType.phone,
                        errorMessage: "يجب ادخال رقم السباك",
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 20),
                      ),

                      _dataPosition.currentAddress.isEmpty
                          ? Container()
                          : CustomTextField(
                              prefixIcon: "assets/img/icons/phone-line(1).png",
                              hint: "عنوانك",
                              controller: _addPreviewProvider.addressController,
                              // keyboardType: TextInputType.phone,
                              errorMessage: "يجب ادخال عنوان المعاينه",
                              // colorFocused: Colors.black,
                            ),

                      // GetX<AddPreviewProvider>(
                      //       builder: (controller) {
                      //         print('addressController.text>>>>>>>>>>>>>>>>>> ${ controller.addressController.text}');
                      //       return  CustomTextField(
                      //           enabled: controller.addressController.text.isNotEmpty
                      //               ? true
                      //               : false,
                      //           prefixIcon: "assets/img/icons/phone-line(1).png",
                      //           hint: "عنوانك",
                      //           controller: controller.addressController,
                      //           // keyboardType: TextInputType.phone,
                      //           // errorMessage: "يجب ادخال عنوان المعاينه",
                      //           // colorFocused: Colors.black,
                      //         );
                      //       }
                      // ),

                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 20),
                      ),

                      SimpleCustomButton(
                        outlineButton: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'مكن عنوانك',
                              color: ConstColors.GREEN_COLOR,
                              fontW: FW.bold,
                              fontSize: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              color: ConstColors.GREEN_COLOR,
                              size: 18,
                            ),
                          ],
                        ),
                        bgColor: ConstColors.GREEN_COLOR,
                        width: ScreenHelper.screenSize(context).width,
                        onTap: () async {
                          node.unfocus();
                          await _dataPosition.getCurrentLocation();
                          // await  _getUserPosition.determinePosition();
                          // _addPreviewProvider.getAddress(_getUserPosition.currentAddress);

                          print(
                              'currentAddress :::: ${_dataPosition.currentAddress}');
                          print(
                              'addressController :::: ${_addPreviewProvider.addressController.text}');
                          Get.to(GetUserLocation());
                        },
                      ),
                      // const SizedBox(height: 20),
                      // InkWell(
                      //   child: CustomText(
                      //     text: 'ادخال عنوان يدويا',
                      //     textAlign: TextAlign.center,
                      //     color: ConstColors.GREY_COLOR,
                      //   ),
                      //   onTap: () {},
                      // ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SimpleCustomButton(
                    bgColor: ConstColors.GREEN_COLOR,
                    text: 'ارسل المعاينه',
                    width: ScreenHelper.screenSize(context).width,
                    onTap: () async {
                      if (!globalKeyPreview.currentState.validate()) {
                        print('NOT validate');
                      } else {
                        if (_dataPosition.latitude == 0.0 ||
                            _dataPosition.longitude == 0.0) {
                          customSnackBar(
                            title: 'مكن عنوانك',
                            body: 'من فضلك مكن عنوانك اولا',
                          );
                        } else {
                          globalKeyPreview.currentState.save();
                          Get.dialog(
                            CustomLoading(loadingText: 'جار ارسال المعاينه...'),
                          );
                          await _addPreviewProvider
                              .addPreview(
                            lat: _dataPosition.latitude,
                            lon: _dataPosition.longitude,
                          )
                              .whenComplete(() {
                            _homeCategoryCustomerProvider
                                .homeCustomerProvider()
                                .whenComplete(() {
                              Get.back();
                              Get.back();

                              Get.dialog(
                                OkDialog(
                                  title: 'تم حجز معاينتك بنجاح',
                                  image: 'assets/img/okicon.png',
                                  body: 'سيتم التواصل معك في خلال ٢٤ ساعه',
                                  onTapOk: () {
                                    Get.back();
                                  },
                                ),
                              );
                            });
                          });
                        }
                      }
                    },
                  ),
                ),

                //
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 15),
                //   child: SimpleCustomButton(
                //     bgColor: ConstColors.GREEN_COLOR,
                //     text: 'ارسل المعاينه',
                //     width: ScreenHelper.screenSize(context).width,
                //     onTap: () {
                //       if (!globalKeyPreview.currentState.validate()) {
                //         print('NOT validate');
                //       } else {
                //         if (_dataPosition.latitude == 0.0 ||
                //             _dataPosition.longitude == 0.0) {
                //           customSnackBar(
                //             title: 'مكن عنوانك',
                //             body: 'من فضلك مكن عنوانك اولا',
                //           );
                //         } else {
                //           globalKeyPreview.currentState.save();
                //           Get.dialog(
                //             CustomDialog(
                //               image: 'assets/img/tab1.png',
                //               body: 'هل انت متاكد من رغبتك في اتمام المعاينة؟',
                //               onTapYes: () async {
                //                 await _addPreviewProvider.addPreview(
                //                   lat: _dataPosition.latitude,
                //                   lon: _dataPosition.longitude,
                //                 );
                //
                //                 await _homeCategoryCustomerProvider
                //                     .homeCustomerProvider();
                //
                //                 Get.back();
                //                 Get.back();
                //
                //                 Get.dialog(
                //                   OkDialog(
                //                     title: 'تم حجز معاينتك بنجاح',
                //                     image: 'assets/img/okicon.png',
                //                     body: 'سيتم التواصل معك في خلال ٢٤ ساعه',
                //                     onTapOk: () {
                //                       Get.back();
                //                       print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
                //                     },
                //                   ),
                //                 );
                //
                //               },
                //             ),
                //           );
                //         }
                //       }
                //     },
                //   ),
                // ),
              ],
            );
          }),
    );
  }
}
