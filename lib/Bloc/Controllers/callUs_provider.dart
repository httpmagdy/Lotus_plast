import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/repository/callUs_repo.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';

class CallUsProvider extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController messageController;

  final CallUSRepo _repo = CallUSRepo();

  Future<MessageCallUS> callUS() async {
try{
  if (!globalKey.currentState.validate()) {
  } else {
    Get.dialog(
      CustomLoading(loadingText: "جار ارسال رسالتك"),
    );

    globalKey.currentState.save();

    MessageCallUS dataResponse = await _repo.callUsRepo(

      name: nameController.text,
      phone: phoneController.text,
      message: messageController.text,

    );

    print('dataResponse.typeUser ::::: ${nameController.text}');
    print('dataResponse.typeUser ::::: ${phoneController.text}');
    print('dataResponse.typeUser ::::: ${messageController.text}');
    print('dataResponse.typeUser ::::: ${dataResponse}');

  nameController.clear();
  phoneController.clear();
  messageController.clear();

    Get.back();

    return dataResponse;

  }
}catch(e){
  print("Call us $e");
}
  }

  @override
  void onInit() {
    phoneController = TextEditingController();
    messageController = TextEditingController();
    nameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    messageController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
