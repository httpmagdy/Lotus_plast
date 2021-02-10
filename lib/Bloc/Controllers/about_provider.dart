import 'package:get/get.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';

class AboutProvider extends GetxController {
  @override
  void onInit() {
    fetchAbout();
    super.onInit();
  }

  RxString aboutText = ''.obs;
  RxBool loading = true.obs;

  NetworkService _networkService = NetworkService();

  Future fetchAbout() async {
    loading(true);
    try {
      var _request = await _networkService.get(url: ApiKey.aboutURL);

      print(' Status Code :::: ${_request.statusCode} ');
      print(' fetchAbout === :::: ${_request.data} ');

      aboutText.value = _request.data["text"];

      loading(false);
    } catch (e) {
      print('fetchAbout ==? $e');
    }
  }
}
