import 'package:get/get.dart';
import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Bloc/repository/add_blumber_coupon_qr_repo.dart';

class AddPlumberCouponQrProvider extends GetxController {

  RxString qrCode = ''.obs;
  RxInt statusId = 0.obs;

  AddPlumberCouponQrRepo _addPlumberCouponQrRepo = AddPlumberCouponQrRepo();

  Future<Message> addPlumberCouponQr() async {
    Message data = await _addPlumberCouponQrRepo.addCouponQrRepo(
      qrCode: qrCode,
      status: statusId,
    );

    print('qrCode  ============ $qrCode');
    print('statusId  ============ $statusId');
    print('addPlumberCouponQr ============ ${data.status}');
    print('addPlumberCouponQr ============ ${data.message}');

    return Message(status: data.status, message: data.message);
  }

}
