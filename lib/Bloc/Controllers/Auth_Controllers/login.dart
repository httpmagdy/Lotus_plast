import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/models/user_info.dart';
import 'package:lotus/Bloc/repository/login_repo.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/screen/auth_Screens/vreify_phone_screen.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';
import 'Phone_Verify_Provider/phone_auth_provider.dart';
import 'auth_provider.dart';

class LoginProvider extends GetxController {
  final PhoneVerifyPhoneProvider _verifyPhoneProvider = Get.put(PhoneVerifyPhoneProvider());

  AuthProvider _authProvider = AuthProvider();
  final GlobalKey<FormState> globalKeyLogin = GlobalKey<FormState>();
  TextEditingController usernameController;
  TextEditingController passwordController;
  RxBool passwordSecure = false.obs;

  // RxInt userType = 0.obs;

  final LoginRepo loginRepo = LoginRepo();

  Future login() async {
    String dToken = await _authProvider.getDeviceToken();

    print('dToken In Login ::::: ${dToken}');

    if (!globalKeyLogin.currentState.validate()) {
    } else {

      Get.dialog(
        CustomLoading(),
      );

      globalKeyLogin.currentState.save();
      UserInfo dataResponse = await loginRepo.loginRepo(
        LoginModel(usernameController.text, passwordController.text, dToken),
      );
      print('dataResponse.typeUser ::::: ${dataResponse}');

      if (dataResponse != null) {

        _authProvider.getUserType(dataResponse.typeUser, dataResponse.data.phoneVerify);
        _authProvider.saveUserInfoStorage(dataResponse);
        passwordController.clear();
        // usernameController.clear();


        if(dataResponse.status == false){

          Get.dialog(
            OkDialog(
              title: "حسابك غير مفعل",
              body: "رجاء قم بتأكيد رقمك",
              buttonName: "تفعيل!",

              onTapOk: () {

                Get.back();

                _verifyPhoneProvider.verifyPhoneNumber(usernameController.text).then((val) {


                  print("VALue => Id :::: $val");

                  if (val != null ) {

                    print("SEND Code Is Done !!!");

                    Get.back();


                    Get.to(PhoneVerificationScreen("${usernameController.text}"));

                  }


                });

              },
            ),
          );

        }

      }


    }
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   passwordController.dispose();
  //   usernameController.dispose();
  //   super.onClose();
  // }

}
