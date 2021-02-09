import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class ExchangeGiftRepo extends NetworkService{

  Future<Message> exchangeGiftRepo(imageId) async{

    var _request = await post(url: ApiKey.exchangeGift, hasHeader: true, body: {
      "image_id": imageId

    });

    print('get Gifts Repo => statusCode : ${_request.statusCode}');
    print('addMaintenanceRepo => data : ${_request.data}');

    return Message.fromJson(_request.data);
  }

}