import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Bloc/repository/Inspector_Repo/scan_Coupon_Qr_Repo.dart';

class ScanQrInspectorProvider extends GetxController {

  // RxString qrCode = ''.obs;
  // RxInt type = 0.obs;
  // RxInt id = 0.obs;

  final GetStorage _box = GetStorage();

  ScanQrInspectorRepo _repo = ScanQrInspectorRepo();

  Future<Message> scanQrInspector(qrCode) async {

    final idUser = _box.read("idUser");

    try {
      Message _data = await _repo.scanQrRepo(
        plumberId: idUser,
        qrCode: qrCode,
        type: 0,
      );

      print('idUser  ============ ${idUser}');
      // print('typeId  ============ ${qrCode.value}');
      // print('typeId ============ ${type.value}');
      // print('typeId ============ ${id}');

      return _data;
    } catch (e) {
      throw e;
    }
  }
}
