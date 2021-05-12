import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Services/api_key.dart';
import '../../../Services/network_services.dart';
import '../../../ui/globalWidget/custom_loading.dart';
import '../../models/message_model.dart';

class CreateNewPassProvider extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;

  RxBool passwordSecure = true.obs;
  RxBool confirmPasswordSecure = true.obs;

  // RxInt userType = 0.obs;
  NetworkService _networkService = NetworkService();

  Future<Message> createNewPass({String phone}) async {
    print('${passwordController.text}');
    print('$phone');
    print('${confirmPasswordController.text}');

    if (!globalKey.currentState.validate()) {
    } else {
      Get.dialog(
        CustomLoading(),
      );

      globalKey.currentState.save();

      print('"password": ${passwordController.text}');
      print("phone $phone");

      var _requste = await _networkService.post(
        url: ApiKey.resetpasswordURL,
        body: {
          "password": passwordController.text,
          "phone": phone,
        },
      );

      print("_requste.data ::: ${_requste.data}");
      return Message.fromJson(_requste.data);
    }
  }

  @override
  void onInit() {
    passwordController = TextEditingController();

    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    passwordController.dispose();

    confirmPasswordController.dispose();

    super.onClose();
  }
}
