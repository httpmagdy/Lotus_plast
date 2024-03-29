import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/user_info.dart';
import '../../repository/register_repo.dart';
import '../../../ui/globalWidget/custom_loading.dart';
import 'auth_provider.dart';

class RegisterProvider extends GetxController {
  AuthProvider _authProvider = AuthProvider();
  final GlobalKey<FormState> globalKeyRegister = GlobalKey<FormState>();
  TextEditingController nameController;
  TextEditingController passwordController;
  TextEditingController phoneController;
  TextEditingController confirmPasswordController;
  TextEditingController identificationController;
  TextEditingController stateController;
  TextEditingController cityController;

  RxBool passwordSecure = true.obs;
  RxBool confirmPasswordSecure = true.obs;
  RxInt typeId = 0.obs;

  // RxInt userType = 0.obs;

  final RegisterRepo registerRepo = RegisterRepo();

  Future register() async {
    String dToken = await _authProvider.getDeviceToken();

    print('dToken In Register ::::: $dToken');

    print('${nameController.text}');
    print('${passwordController.text}');
    print('${phoneController.text}');
    print('${confirmPasswordController.text}');
    print('${identificationController.text}');
    print('${stateController.text}');
    print('${cityController.text}');

    if (!globalKeyRegister.currentState.validate()) {
    } else {
      Get.dialog(
        CustomLoading(),
      );

      globalKeyRegister.currentState.save();

      var dataResponse = await registerRepo.registerRepo(
        RegisterModel(
          name: nameController.text,
          password: passwordController.text,
          phone: phoneController.text,
          cityId: cityController.text,
          stateId: stateController.text,
          identificationNumber: identificationController.text,
          typeUser: typeId.value,
          deviceToken: dToken,
        ),
      );

      if (dataResponse != null) {
        // _authProvider.getUserType(dataResponse.typeUser, dataResponse.data.phoneVerify);
        _authProvider.saveUserInfoStorage(userInfo: dataResponse);
      }

      return dataResponse;
    }
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    nameController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    identificationController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    identificationController.dispose();
    stateController.dispose();
    cityController.dispose();
    super.onClose();
  }
}
