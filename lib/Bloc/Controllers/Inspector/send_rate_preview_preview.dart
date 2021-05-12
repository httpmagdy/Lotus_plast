import 'package:get/get.dart';

import '../../models/message_model.dart';
import '../../repository/Inspector_Repo/send_rate_preview_repo.dart';

class SendRatePreviewProvider extends GetxController {
  // RxString qrCode = ''.obs;
  // RxInt type = 0.obs;
  RxDouble rate = 3.0.obs;
  // final GetStorage _box = GetStorage();

  final SendRatePreviewRepo _repo = SendRatePreviewRepo();

  Future<Message> sendRatePreview(previewId) async {
    try {
      Message _data = await _repo.sendRateRepo(
        previewId: previewId,
        rate: rate.value,
      );

      print('rate  ============ ${rate.value}');
      print('previewId  ============ ${previewId}');
      // print('typeId  ============ ${qrCode.value}');
      // print('typeId ============ ${type.value}');
      // print('typeId ============ ${id}');

      return _data;
    } catch (e) {
      throw e;
    }
  }
}
