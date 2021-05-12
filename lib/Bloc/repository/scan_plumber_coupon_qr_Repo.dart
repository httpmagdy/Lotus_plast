import '../../Services/api_key.dart';
import '../../Services/network_services.dart';
import '../models/message_model.dart';

class ScanPlumberCouponQrRepo extends NetworkService {
  Future<MessageScan> scanCouponQrRepo({
    qrCode,
  }) async {
    var _request = await post(
      url: ApiKey.scanPlumberCouponQrURL,
      hasHeader: true,
      body: {
        'qr_code': qrCode,
      },
    );

    print('Scan Plumber Coupon Qr Repo =>');

    print('_request ${_request.data}');
    print('Exchange Coupons Repo => statusCode : ${_request.data["message"]}');
    print('Exchange Coupons Repo => statusCode : ${_request.data["status"]}');
    print('Exchange Coupons Repo => statusCode : ${_request.statusCode}');

    return MessageScan.fromJson(_request.data);
  }
}
