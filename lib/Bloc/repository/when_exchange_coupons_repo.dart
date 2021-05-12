import '../../Services/api_key.dart';
import '../../Services/network_services.dart';

class ExchangeCouponsRepo extends NetworkService {
  Future exchangeCouponsRepo({
    price,
    type,
    wallerNumber,
  }) async {
    var _request = await post(
      url: ApiKey.whenExchangeCouponsURL,
      hasHeader: true,
      body: {
        'price': price,
        'type': type,
        'waller_number': wallerNumber,
      },
    );

    print('Exchange Coupons Repo =>');
    // print('Exchange Coupons Repo => statusCode : ${_request.data["message"]}');
    // print('Exchange Coupons Repo => statusCode : ${_request.data["status"]}');
    // print('Exchange Coupons Repo => statusCode : ${_request.statusCode}');

    return Message(
        status: _request.data["status"], message: _request.data["message"]);
  }
}

class Message {
  final String message;
  final bool status;

  Message({this.message, this.status});
}
