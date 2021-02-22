import 'package:get/get.dart';
import 'package:lotus/Services/api_key.dart';
import 'package:lotus/Services/network_services.dart';
import 'package:lotus/utils/constants.dart';
import '../../ui/globalWidget/custom_loading.dart';
import 'Auth_Controllers/auth_provider.dart';
import '../../Bloc/Controllers/Notifications_Management/notifications_page_provider.dart';

class LogoutProvider extends GetxController {
  // @override
  // void onInit() {
  //   fetchPrivacy();
  //   super.onInit();
  // }
  NotificationsPageProvider _notificationsPageProvider = Get.find();
  AuthProvider _authProvider = AuthProvider();

  NetworkService _networkService = NetworkService();


  Future logout() async {
    // loading(true);
    try {
      Get.dialog(CustomLoading(
        loadingText: "جار تسجيل الخروج",
        bg: ConstColors.WHITE,
      ));

      var _request =
          await _networkService.get(url: ApiKey.logoutURL, hasHeader: true);

      print(' Status Code :::: ${_request.statusCode} ');
      print(' fetchAbout === :::: ${_request.data} ');

      await _authProvider.deleteUserInfoStorage();
       _notificationsPageProvider.myNotifications.clear();
      // privacyText.value = _request.data["text"];
      // loading(false);

      Get.back();
    } catch (e) {
      print('fetchAbout ==? $e');
    }
  }
}
