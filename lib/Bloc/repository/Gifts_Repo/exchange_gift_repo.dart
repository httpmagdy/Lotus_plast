import '../../../Services/api_key.dart';
import '../../../Services/network_services.dart';
import '../../models/message_model.dart';

class ExchangeGiftRepo extends NetworkService {
  Future<Message> exchangeGiftRepo(imageId) async {
    var _request = await post(
        url: ApiKey.exchangeGift, hasHeader: true, body: {"image_id": imageId});

    print('get Gifts Repo => statusCode : ${_request.statusCode}');
    print('addMaintenanceRepo => data : ${_request.data}');

    return Message.fromJson(_request.data);
  }
}
