import 'package:get/get.dart';
import 'package:lotus/Bloc/models/message_model.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';

class PhonechecProvider extends GetxController {
  NetworkService _networkService = NetworkService();

  Future<Message> phonechec({phone}) async {
    Get.dialog(CustomLoading(
      loadingText: "جاري التحقق من الرقم",
    ));

    var _request = await _networkService.post(
      url: ApiKey.phonecheckURL,
      // hasHeader: true,
      body: {
        'phone': phone,
      },
    );

    print('phonechec => statusCode : ${_request.statusCode}');
    print('phonechec => status : ${_request.data["status"]}');
    print('phonechec => message : ${_request.data["message"]}');

    return Message.fromJson(_request.data);
  }
}
