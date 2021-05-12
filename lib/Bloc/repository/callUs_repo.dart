import '../../Services/api_key.dart';
import '../../Services/network_services.dart';

class CallUSRepo extends NetworkService {
  Future<MessageCallUS> callUsRepo({name, phone, message}) async {
    var _request = await post(url: ApiKey.callusURL, hasHeader: true, body: {
      'name': name,
      'phone': phone,
      'message': message,
    });

    print('LOGIN => statusCode : ${_request.statusCode}');
    print('LOGIN => statusCode : ${_request.data}');

    return MessageCallUS.fromJson(_request.data);
  }
}

class MessageCallUS {
  final int status;
  final String message;

  MessageCallUS({this.status, this.message});

  factory MessageCallUS.fromJson(Map<String, dynamic> json) => MessageCallUS(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
      );
}
