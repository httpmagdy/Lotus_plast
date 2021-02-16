import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lotus/Bloc/Controllers/AddMaintenance/add_maintenance.dart';
import 'package:lotus/Bloc/Controllers/AddMaintenance/damage_types.dart';
import 'package:lotus/Bloc/Controllers/Customer/home_provider_customer.dart';
import 'package:lotus/Bloc/Controllers/Plumber/home_provider_plumber.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/globalWidget/custom_snack_bar.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/ui/widget/custom_text_field.dart';
import 'package:lotus/utils/constants.dart';

class ReportDamage extends StatefulWidget {
  final bool haveAppbar;

  ReportDamage({this.haveAppbar = false});

  @override
  _ReportDamageState createState() => _ReportDamageState();
}

class _ReportDamageState extends State<ReportDamage> {
  AddMaintenanceProvider _addMaintenanceProvider =
      Get.put(AddMaintenanceProvider());
  HomeCategoryCustomerProvider _homeCategoryCustomerProvider =
      Get.put(HomeCategoryCustomerProvider());

  HomeCategoryPlumberProvider _homeCategoryPlumberProvider =
      Get.put(HomeCategoryPlumberProvider());

  final GlobalKey<FormState> globalKeyMaintenance = GlobalKey<FormState>();

  GetStorage box = GetStorage();

  String selectError;

  //
  // File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _addMaintenanceProvider.image = File(image.path);
      } else {
        print('No image selected.');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    var typeUser = box.read('typeUser');

    return Scaffold(
      appBar: widget.haveAppbar
          ? customAppBar(context: context, isHome: false)
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context, 25)),
          child: Column(
            children: [
              SizedBox(
                height: ScreenHelper.screenHeight(context, 30),
              ),
              Image.asset(
                "assets/img/showProducts.png",
                width: ScreenHelper.screenWidth(context, 328),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 17),
              ),
              CustomText(
                text: "تبليغ عن عطل",
                fontSize: ScreenHelper.screenFont(context, 25),
                fontW: FW.bold,
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 17),
              ),
              CustomText(
                text: "ادخل وصف العطل لنتمكن من اصلاحه",
                fontSize: ScreenHelper.screenFont(context, 10),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 17),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 10)),
                child: Container(
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
                    child: GetX<DamageTypesProvider>(
                      builder: (controller) => DropdownButton(
                        hint: CustomText(text: "نوع العطل"),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36.0,
                        isExpanded: true,
                        underline: Container(color: Colors.transparent),
                        value: selectError,
                        items: controller.allDamageTypes.map((value) {
                          return DropdownMenuItem(
                            value: value.name,
                            child: CustomText(text: value.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectError = value;
                          });
                          _addMaintenanceProvider.getIdType(
                              controller.allDamageTypes, value);
                        },
                      ),
                    ),
                  ),
                ),
                // CustomTextField(
                //   horizentalPadding: 25,
                //   suffixIcon: Icons.arrow_drop_down,
                //   onSuffixTap: () {},
                //   hint: "نوع العطل ",
                //   controller: _phoneController,
                // ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 13),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding:  EdgeInsets.only(right: ScreenHelper.screenWidth(context,20),),
                  //   child: CustomText(
                  //     text: ("وصف العطل"),
                  //     fontSize: 14,
                  //     color: ConstColors.GREY_COLOR,
                  //     textAlign: TextAlign.start,
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context, 10)),
                    child: Stack(
                      children: [
                        Form(
                          key: globalKeyMaintenance,
                          child: CustomTextField(
                            colorFocused: ConstColors.GREEN_COLOR,
                            horizentalPadding: 25,
                            maxLines: 3,
                            verticalPadding: 14,
                            hint:
                                "وصف العطل \n (يمكن ان يحتوي الوصف علي صوره للعطل)",
                            controller:
                                _addMaintenanceProvider.messageController,
                            errorMessage: "يجب ادخال وصف للعطل",
                          ),
                        ),
                        Positioned(
                          top: ScreenHelper.screenHeight(context, 12),
                          left: ScreenHelper.screenWidth(context, 12),
                          child: InkWell(
                            onTap: getImage,
                            child:  _addMaintenanceProvider.image == null
                                ? Icon(
                                    Icons.camera_alt_outlined,
                                    size:
                                        ScreenHelper.screenSize(context).width *
                                            0.060,
                                    color: ConstColors.FORM_COLOR,
                                  )
                                : SelectedCameraImage(image:  _addMaintenanceProvider.image),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 30),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SimpleCustomButton(
                  width: ScreenHelper.screenSize(context).width,
                  text: 'ارسل العطل',
                  onTap: () async {
                    if (!globalKeyMaintenance.currentState.validate()) {
                      print('NOT validate');
                    } else {
                      globalKeyMaintenance.currentState.save();

                      if (_addMaintenanceProvider.idTypeSelected.value == 0) {
                        customSnackBar(
                          title: 'نوع العطل',
                          body: 'من فضلك اختر نوع العطل',
                        );
                      } else {

                        Get.dialog(
                          CustomLoading(loadingText: 'جار ارسال طلب الصيانه...'),
                        );

                        await _addMaintenanceProvider
                            .addMaintenance()
                            .whenComplete(
                              () async {
                            if (typeUser == 0) {
                              await _homeCategoryPlumberProvider
                                  .homePlumberProvider();
                            } else if (typeUser == 1) {
                              await _homeCategoryCustomerProvider
                                  .homeCustomerProvider();
                            } else if (typeUser == 2) {}

                            Get.back();
                            Get.back();

                            Get.dialog(
                              OkDialog(
                                title: 'تم ارسال العطل بنجاح',
                                image: 'assets/img/okicon.png',
                                body: 'سيتم التواصل معك في خلال ٢٤ ساعه',
                                onTapOk: () {
                                  Get.back();
                                },
                              ),
                            );
                          },
                        );

                      }



                    }
                  },
                  // outlineButton: true,
                  bgColor: ConstColors.GREEN_COLOR,
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedCameraImage extends StatelessWidget {
  const SelectedCameraImage({
    Key key,
    @required File image,
  })  : _image = image,
        super(key: key);

  final File _image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Image.file(
        _image,
        fit: BoxFit.cover,
        height: ScreenHelper.screenHeight(context, 30),
        width: ScreenHelper.screenWidth(context, 30),
      ),
    );
  }
}
