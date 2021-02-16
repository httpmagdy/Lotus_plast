import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Bloc/repository/Inspector_Repo/send_report_preview_repo.dart';

class SendReportPreviewInspectorProvider extends GetxController {
  TextEditingController desController;

  RxInt previewId = 0.obs;
  File image;
  SendReportPreviewInspectorRepo _repo = SendReportPreviewInspectorRepo();

  Future<Message> sendReportPreviewInspector() async {
    // Message data;

    if (image == null) {
      Message data = await _repo.sendReportPreview(
          description: desController.text, previewId: previewId);
      return Message(status: data.status, message: data.message);
    } else {
      var statusCode = await _repo.sendReportPreviewWithImage(
          description: desController.text, previewId: previewId, image: image);

      print("================ $statusCode =================");

      if (statusCode != 200) {
        return Message(status: false, message: "فشل ارسال العينه");
      } else {
        print('preview With image  ============ ');

        return Message(status: true, message: "تمت المعاينه بنجاح");
      }
    }

    // print('previewId  ============ $previewId');
    // print('description  ============ ${desController.text}');
    // print('addPlumberCouponQr ============ ${data.status}');
    // print('addPlumberCouponQr ============ ${data.message}');
  }

  @override
  void onInit() {
    desController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    desController.dispose();

    super.dispose();
  }
}
