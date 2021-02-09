import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Bloc/repository/Inspector_Repo/scan_Coupon_Qr_Repo.dart';
import 'package:lotus/Bloc/repository/Inspector_Repo/send_rate_preview_repo.dart';

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
