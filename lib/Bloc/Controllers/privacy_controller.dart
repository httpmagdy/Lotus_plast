import 'package:get/get.dart';

import '../../Services/api_key.dart';
import '../../Services/network_services.dart';

class PrivacyProvider extends GetxController {
  @override
  void onInit() {
    fetchPrivacy();
    super.onInit();
  }

  RxString privacyText = ''.obs;
  RxBool loading = true.obs;

  NetworkService _networkService = NetworkService();

  Future fetchPrivacy() async {
    loading(true);
    try {
      var _request = await _networkService.get(url: ApiKey.privacyURL);

      print(' Status Code :::: ${_request.statusCode} ');
      print(' fetchAbout === :::: ${_request.data} ');

      privacyText.value = _request.data["text"];

      loading(false);
    } catch (e) {
      print('fetchAbout ==? $e');
    }
  }
}
