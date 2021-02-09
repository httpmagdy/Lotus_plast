import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class ReportPreviewScreen extends StatefulWidget {
  @override
  _ReportPreviewScreenState createState() => _ReportPreviewScreenState();
}

class _ReportPreviewScreenState extends State<ReportPreviewScreen> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          onPressed: () {},
          transparent: false,
          isHome: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/img/showProducts.png",
                width: ScreenHelper.screenWidth(context, 328),
              ),
              CustomText(
                text: "تقرير المعاينة ",
                fontSize: ScreenHelper.screenFont(context, 25),
                fontW: FW.bold,
              ),
              // CustomText(
              //   text: "اكتب وصفك للمعايينة التي تمت",
              //   fontSize: 10,
              // ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 31),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetDetals(
                          typeNamed: "العميل",
                          name: "محمد حماده حمو حماده",
                          phone: "0102929956",
                        ),
                        const SizedBox(height: 20),
                        WidgetDetals(
                          typeNamed: "السباك",
                          name: "محمد حماده حمو مش حماده",
                          phone: "1268566656",
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: ScreenHelper.screenSize(context).width - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    ScreenHelper.screenSize(context).width * .6,
                                child: CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity
                                      .leading, //  <-- leading Checkbox
                                  checkColor: ConstColors.WHITE,
                                  activeColor: ConstColors.ORANGE_COLOR,
                                  // selectedTileColor: Colors.green,
                                  value: checkedValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkedValue = newValue;
                                    });
                                    print('val ::: $newValue');
                                  },
                                  contentPadding: EdgeInsets.all(0),
                                  title: CustomText(
                                    // textAlign: TextAlign.start,
                                    text: "هل تمت المعاينه بنجاح",
                                    underline: true,
                                    color: ConstColors.ORANGE_COLOR,
                                    fontSize:
                                        ScreenHelper.screenFont(context, 15),
                                    padding: EdgeInsets.only(left: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: ScreenHelper.screenHeight(context, 25),
              ),
              SimpleCustomButton(
                text: "حفظ",
                onTap: () {
                  // Get.dialog(RatingDialog(
                  //   onTap: () {
                  //     Get.back();
                  //     Get.back();
                  //     // Get.to(DetailsPreview());
                  //   },
                  // ));
                },
                bgColor: Color(0xFF99D521),
                width: 320,
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetDetals extends StatelessWidget {
  final String typeNamed, name, phone;
  final onEdit;
  final bool haveEdit;

  WidgetDetals(
      {this.typeNamed,
      this.name,
      this.phone,
      this.onEdit,
      this.haveEdit = false});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              haveEdit ? Spacer() : Container(),
              haveEdit
                  ? InkWell(
                      onTap: onEdit,
                      child: CustomText(
                        color: ConstColors.ORANGE_COLOR,
                        text: "تعديل",
                        fontSize: ScreenHelper.screenFont(context, 12),
                      ),
                    )
                  : Container(),
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
        ],
      ),
    );
  }
}
