import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/user_info.dart';
import '../../repository/login_repo.dart';
import '../../../ui/globalWidget/custom_loading.dart';
import '../../../ui/screen/auth_Screens/vreify_phone_screen.dart';
import '../../../ui/widget/custom_dialog.dart';
import 'Phone_Verify_Provider/phone_auth_provider.dart';
import 'auth_provider.dart';

class LoginProvider extends GetxController {
  final PhoneVerifyPhoneProvider _verifyPhoneProvider =
      Get.put(PhoneVerifyPhoneProvider());

  AuthProvider _authProvider = AuthProvider();
  final GlobalKey<FormState> globalKeyLoginn = GlobalKey<FormState>();
  TextEditingController usernameController;
  TextEditingController passwordController;
  RxBool passwordSecure = true.obs;

  // RxInt userType = 0.obs;

  final LoginRepo loginRepo = LoginRepo();

  Future login() async {
    String dToken = await _authProvider.getDeviceToken();

    print('dToken In Login ::::: $dToken');

    if (!globalKeyLoginn.currentState.validate()) {
    } else {
      Get.dialog(
        CustomLoading(),
      );

      globalKeyLoginn.currentState.save();
      UserInfo dataResponse = await loginRepo.loginRepo(
        LoginModel(usernameController.text, passwordController.text, dToken),
      );
      print('dataResponse.typeUser ::::: $dataResponse');

      if (dataResponse != null) {
        _authProvider.getUserType(
          dataResponse.typeUser,
          dataResponse.data.phoneVerify,
        );

        await _authProvider.saveUserInfoStorage(userInfo: dataResponse);
        passwordController.clear();
        // usernameController.clear();

        if (dataResponse.data.phoneVerify == 0) {
          Get.back();

          Get.dialog(
            OkDialog(
              title: "حسابك غير مفعل",
              body: "رجاء قم بتأكيد رقمك",
              buttonName: "تفعيل!",
              image: "assets/img/cobone.png",
              onTapOk: () {
                Get.back();

                _verifyPhoneProvider
                    .verifyPhoneNumber(usernameController.text)
                    .then((val) {
                  print("VALue => Id :::: $val");

                  if (val != null) {
                    print("SEND Code Is Done !!!");

                    Get.back();

                    Get.to(
                        PhoneVerificationScreen("${usernameController.text}"));
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

  @override
  void onClose() {
    passwordController.dispose();
    usernameController.dispose();
    super.onClose();
  }
}
