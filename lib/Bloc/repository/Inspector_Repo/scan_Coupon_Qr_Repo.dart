import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class ScanQrInspectorRepo extends NetworkService {
  Future<Message> scanQrRepo({
    qrCode,
    type,
    plumberId
  }) async {
    var _request = await post(
      url: ApiKey.scanCouponQrURL,
      hasHeader: true,
      body: {
        'qr_code': qrCode,
        'type': type,
        'blumber_id': plumberId,
      },
    );

    return Message.fromJson(_request.data);

    print( 'Send Report Preview Inspector Repo ========> statusCode : ${_request.statusCode} ::::::::::::::');

  }
}
