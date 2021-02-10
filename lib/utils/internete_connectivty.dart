import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:lotus/ui/widget/custom_dialog.dart';

class NWConnectivty extends GetxController {
  StreamSubscription subscription;

  @override
  void onInit() {
    subscription = Connectivity().onConnectivityChanged.listen(showConnectivty);
    super.onInit();
  }

  showConnectivty(ConnectivityResult result) {
    bool hasIntenet = result != ConnectivityResult.none;

    if (hasIntenet) {
      // Get.dialog(OkDialog(
      //   title: "u have internet",
      //   body: "u have internet",
      // ));
      // return 'u have internet';
      return true;
    } else {
      Get.back();
      Get.dialog(OkDialog(
        title: "انت غير متصل بالانترنت",
        body: "برجاء تحقق من اتصالك ثم حاول مره اخري",
        image: "assets/img/connec.jpeg",
        buttonName: "حسنا",
        onTapOk: () {
          Get.back();
        },
      ));
      return false;
      // return 'u have no internet';
    }
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }
}
