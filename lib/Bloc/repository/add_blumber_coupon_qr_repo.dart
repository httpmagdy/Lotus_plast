import '../models/message_model.dart';
import '../../Services/api_key.dart';
import '../../Services/network_services.dart';

class AddPlumberCouponQrRepo extends NetworkService {
  Future<Message> addCouponQrRepo({
    qrCode,
    status,
  }) async {
    var _request = await post(
      url: ApiKey.addPlumberCouponQrURL,
      hasHeader: true,
      body: {
        'qr_code': qrCode,
        'status': status,
      },
    );

    print('Scan Plumber Coupon Qr Repo =>');

    print('_request ${_request.data}');
    print('Exchange Coupons Repo => statusCode : ${_request.data["message"]}');
    print('Exchange Coupons Repo => statusCode : ${_request.data["status"]}');
    print('Exchange Coupons Repo => statusCode : ${_request.statusCode}');

    return Message.fromJson(_request.data);
  }
}
