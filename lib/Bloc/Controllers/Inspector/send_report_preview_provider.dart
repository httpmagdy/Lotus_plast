import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Bloc/repository/Inspector_Repo/send_report_preview_repo.dart';

class SendReportPreviewInspectorProvider extends GetxController {



  TextEditingController desController;

  RxInt previewId = 0.obs;

  SendReportPreviewInspectorRepo _repo = SendReportPreviewInspectorRepo();

  Future<Message> sendReportPreviewInspector() async {
    Message data = await _repo.sendReportPreview(description: desController.text, previewId: previewId);

    print('previewId  ============ $previewId');
    print('description  ============ ${desController.text}');
    print('addPlumberCouponQr ============ ${data.status}');
    print('addPlumberCouponQr ============ ${data.message}');

    return Message(status: data.status, message: data.message);
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
