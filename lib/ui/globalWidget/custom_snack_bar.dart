import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus/ui/widget/custom_text.dart';

customSnackBar({@required String title, @required String body}) {
  return Get.snackbar(
    '', '',
    titleText: CustomText(
      text: '$title',
      color: Colors.white,
      fontSize: 14,
    ),
    messageText: CustomText(
      text: '$body',
      color: Colors.white,
    ),
    backgroundColor: Colors.black.withOpacity(0.45),
    // barBlur: 0.8,
  );
}
