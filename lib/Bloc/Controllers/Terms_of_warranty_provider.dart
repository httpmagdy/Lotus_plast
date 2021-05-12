import 'package:get/get.dart';

import '../../Services/api_key.dart';
import '../../Services/network_services.dart';

class TermsOfWarrantyProvider extends GetxController {
  @override
  void onInit() {
    fetchTermsOfWarranty();
    super.onInit();
  }

  RxString text = ''.obs;
  RxBool loading = true.obs;

  NetworkService _networkService = NetworkService();

  Future fetchTermsOfWarranty() async {
    loading(true);
    try {
      var _request = await _networkService.get(url: ApiKey.gettermsWarrantyURL);

      print(' Status Code :::: ${_request.statusCode} ');
      print(' fetchAbout === :::: ${_request.data} ');

      text.value = _request.data["text"];

      loading(false);
    } catch (e) {
      print('fetchAbout ==? $e');
    }
  }
}
