import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lotus/Bloc/Controllers/Inspector/home_inspector_provider.dart';
import 'package:lotus/Bloc/Controllers/Inspector/send_report_preview_provider.dart';
import 'package:lotus/Bloc/models/home_inspector_model.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/globalWidget/custom_snack_bar.dart';
import 'package:lotus/ui/screen/Inspector/type_account.dart';
import 'package:lotus/ui/screen/ReportADamage/report_a_damage.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/ui/widget/custom_text_field.dart';
import 'package:lotus/utils/constants.dart';
import 'dart:io';
import 'edit_info_plumber.dart';

class ReportPreviewInspector extends StatefulWidget {
  final Complete data;

  ReportPreviewInspector(this.data);

  @override
  _ReportPreviewInspectorState createState() => _ReportPreviewInspectorState();
}

class _ReportPreviewInspectorState extends State<ReportPreviewInspector> {
  final GlobalKey<FormState> desKey = GlobalKey<FormState>();
  final SendReportPreviewInspectorProvider _inspectorProvider =
      Get.put(SendReportPreviewInspectorProvider());
  final HomeInspectorProvider _homeInspectorProvider =
      Get.put(HomeInspectorProvider());

  // QrProvider _qrProvider = Get.put(QrProvider());
  bool checkedValue = false;

  final picker = ImagePicker();

  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _inspectorProvider.image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _inspectorProvider.previewId.value = widget.data.id;

    var node = FocusScope.of(context);

    print(
        "::::::::::: widget.data.pulmberName :::::: ${widget.data.customerPhone}");

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
                text: "تقرير المعاينة",
                fontSize: ScreenHelper.screenFont(context, 25),
                fontW: FW.bold,
              ),
              CustomText(
                text: "اكتب وصفك للمعايينة التي تمت",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.data.customerName == null
                            ? Container()
                            : WidgetDetals(
                                typeNamed: "العميل",
                                name: "${widget.data.customerName}",
                                phone: "${widget.data.customerPhone}",
                              ),
                        WidgetDetals(
                          haveEdit: true,
                          onEdit: () {
                            Get.to(EditDataInfoPlumber());
                          },
                          typeNamed: "السباك",
                          name: "${widget.data.pulmberName}",
                          phone: "${widget.data.pulmberPhone}",
                        ),
                        RowTextW(title: "التاريخ", body: "${widget.data.date}"),
                        RowTextW(title: "الوقت", body: "${widget.data.time}"),
                        RowTextW(
                            title: "العنوان", body: "${widget.data.address}"),
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
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  //  <-- leading Checkbox
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
                              InkWell(
                                onTap: () {
                                  Get.to(TypeAccount());
                                  // _qrProvider.scanQR();
                                },
                                child: Image.asset(
                                  "assets/img/scanCode.png",
                                  height:
                                      ScreenHelper.screenHeight(context, 42),
                                  width: ScreenHelper.screenWidth(context, 42),
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
                height: ScreenHelper.screenHeight(context, 15),
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 600),
                child: !checkedValue
                    ? Container(
                        key: UniqueKey(),
                      )
                    : Column(
                        key: UniqueKey(),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Form(
                                key: desKey,
                                child: CustomTextField(
                                  horizentalPadding: 25,
                                  maxLines: 2,
                                  verticalPadding: 14,
                                  hint: "وصف المعاينه",
                                  controller: _inspectorProvider.desController,
                                  errorMessage: "يجب ادخال وصف للمعاينه",
                                ),
                              ),
                              Positioned(
                                top: ScreenHelper.screenHeight(context, 12),
                                left: ScreenHelper.screenWidth(context, 12),
                                child: InkWell(
                                  onTap: getImage,
                                  child: _inspectorProvider.image == null
                                      ? Icon(
                                          Icons.camera_alt_outlined,
                                          size: ScreenHelper.screenSize(context)
                                                  .width *
                                              0.060,
                                          color: ConstColors.FORM_COLOR,
                                        )
                                      : SelectedCameraImage(
                                          image: _inspectorProvider.image),
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
                text: "ارسل التقرير",
                onTap: () async {
                  node.unfocus();
                  if (checkedValue == false) {
                    customSnackBar(
                        title: "اتمام المعاينه",
                        body: "برجاء حدد هل تمت المعاينه ام لا ؟");
                  } else {
                    if (!desKey.currentState.validate()) {
                    } else {
                      desKey.currentState.save();
                      Get.dialog(
                        CustomLoading(loadingText: 'جار اتمام المعاينه...'),
                      );
                      await _inspectorProvider
                          .sendReportPreviewInspector()
                          .then((value) {
                        print('${value.message}');

                        _homeInspectorProvider.homeInspector().whenComplete(() {
                          Get.back();
                          Get.back();

                          Get.dialog(
                            OkDialog(
                              title: ' اتمام المعاينه ',
                              image: 'assets/img/okicon.png',
                              body: '${value.message}',
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

class RowTextW extends StatelessWidget {
  final body, title;

  RowTextW({this.body, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(
                width: 75,
                child: CustomText(
                  text: "$title",
                  fontSize: ScreenHelper.screenFont(context, 12),
                  // padding: EdgeInsets.only(bottom: 15),
                ),
              ),
              Container(
                width: ScreenHelper.screenSize(context).width * .65,
                child: CustomText(
                  text: "$body",
                  fontSize: ScreenHelper.screenFont(context, 12),
                  fontW: FW.bold,
                  // overflow: true,
                ),
              ),
            ],
          ),
        ],
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
              SizedBox(
                width: 75,
                child: CustomText(
                  text: "اسم $typeNamed",
                  fontSize: ScreenHelper.screenFont(context, 12),
                  // padding: EdgeInsets.only(left: 20),
                ),
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
          const SizedBox(height: 15),
          Row(
            children: [
              SizedBox(
                width: 75,
                child: CustomText(
                  text: "رقم الهاتف",
                  fontSize: ScreenHelper.screenFont(context, 12),
                  // padding: EdgeInsets.only(left: 24),
                ),
              ),
              CustomText(
                text: "$phone",
                fontSize: ScreenHelper.screenFont(context, 12),
                fontW: FW.bold,
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
