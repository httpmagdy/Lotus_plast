import '../../../Services/api_key.dart';
import '../../../Services/network_services.dart';
import '../../models/message_model.dart';

class ScanQrInspectorRepo extends NetworkService {
  Future<Message> scanQrRepo({qrCode, type, plumberId}) async {
    print('qrCode :: $qrCode');
    print('type :: $type');
    print('plumberId :: $plumberId'); 

    var _request = await post(
      url: ApiKey.scanCouponQrURL,
      hasHeader: true,
      body: {
        'qr_code': qrCode,
        'type': type,
        'blumber_id': plumberId,
      },
    );

    print('Send Report Preview Inspector Repo ========> statusCode : ${_request.statusCode} ::::::::::::::');
    return Message.fromJson(_request.data);

  }
}
