import 'package:get/get.dart';

import '../../models/message_model.dart';
import '../../repository/scan_plumber_coupon_qr_Repo.dart';

class ScanPlumberCouponQrProvider extends GetxController {
  RxString qrCode = ''.obs;
  RxInt later = 0.obs;
  RxInt now = 0.obs;

  ScanPlumberCouponQrRepo _scanPlumberCouponQrRepo = ScanPlumberCouponQrRepo();

  Future<MessageScan> scanPlumberCouponQr() async {
    MessageScan data = await _scanPlumberCouponQrRepo.scanCouponQrRepo(
      qrCode: qrCode,
    );

    later.value = data.later;
    now.value = data.now;

    print('typeId  ============ $qrCode');
    print('typeId ============ ${data.status}');
    print('typeId ============ ${data.message}');

    return MessageScan(
        status: data.status,
        message: data.message,
        later: data.later,
        now: data.now);
  }
}
