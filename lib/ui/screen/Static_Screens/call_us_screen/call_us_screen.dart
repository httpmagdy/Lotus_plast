import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/callUs_provider.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/ui/widget/custom_text_field.dart';

class CallUsScreen extends StatelessWidget {
  final CallUsProvider _callUsProvider = Get.put(CallUsProvider());

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);

    return Scaffold(
      appBar:
          customAppBar(context: context, onPressed: () {}, transparent: false,isHome: false),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,),
          child: Form(
            key: _callUsProvider.globalKey,
            child: Column(

              children: [
                SizedBox(height: ScreenHelper.screenHeight(context,25),),
                CustomText(text: "اتصل بنا", fontW: FW.bold,fontSize: 20,),
                SizedBox(height: ScreenHelper.screenHeight(context,25),),

                Image.asset(
                  "assets/img/MaskGroup1384.png",
                  height: ScreenHelper.screenHeight(context, 185),
                  // width: ScreenHelper.screenWidth(context, 303),
                ),
                SizedBox(height: ScreenHelper.screenHeight(context,25),),
                CustomTextField(
                  prefixIcon: "assets/img/icons/prof.png",
                  hint: "اسم المستخدم",
                  controller: _callUsProvider.nameController,
                  errorMessage: "يجب ادخال اسم المستخدم",
                ),
                SizedBox(height: ScreenHelper.screenHeight(context,15),),
                CustomTextField(
                  prefixIcon: "assets/img/icons/phone-line(1).png",
                  hint: " رقم الموبايل",
                  controller: _callUsProvider.phoneController,
                  errorMessage: "يجب ادخال رقم الموبايل",
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: ScreenHelper.screenHeight(context,15),),
                CustomTextField(
                  verticalPadding: 16,
                  horizentalPadding: 14,
                  hint: "اكتب رسالتك",
                  controller: _callUsProvider.messageController,
                  maxLines: 5,
                  errorMessage: "يجب كتابه رساله",

                ),
                SizedBox(height: ScreenHelper.screenHeight(context,30),),

                SimpleCustomButton(
                  width: ScreenHelper.screenSize(context).width,
                  onTap: () async{
                    node.unfocus();
                    print("SEND -------------");
                             await  _callUsProvider.callUS().then((val) {
                              Get.dialog( OkDialog(
                                image: "assets/img/cobone.png",

                                onTapOk: (){
                                Get.back();
                                Get.back();
                                Get.back();
                              },
                                title: "ارسال رسالتك",
                                body: "${val.message}",
                              ),);
                             });
                  },
                  text: 'ارسال',
                ),
                SizedBox(height: ScreenHelper.screenHeight(context,30),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
