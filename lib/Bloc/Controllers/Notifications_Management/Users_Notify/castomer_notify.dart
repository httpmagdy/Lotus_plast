import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/Customer/home_provider_customer.dart';
import 'package:lotus/Bloc/Controllers/Inspector/send_rate_preview_preview.dart';
import 'package:lotus/Bloc/Controllers/Plumber/home_provider_plumber.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/globalWidget/custom_snack_bar.dart';
import 'package:lotus/ui/screen/details_preview.dart';

class CustomerNotify {
  final SendRatePreviewProvider _sendRatePreviewProvider = Get.find();
  final HomeCategoryCustomerProvider _home = Get.find();

  void customerNotify(int id) {

    print("customer Notify ===========>");


    var goTo = _home.getPreviewById(id);
    print(goTo.id);


    Get.to(
      DetailsPreview(
        onTapRate: () async {
          Get.dialog(CustomLoading(
              loadingText:
              "جار ارسال تقييمك"));
          await _sendRatePreviewProvider
              .sendRatePreview(goTo.id)
              .then((value) {
            _home
                .homeCustomerProvider()
                .whenComplete(() {
              Get.back();
              Get.back();
              Get.back();
              customSnackBar(
                title: "تقييم المعاينه",
                body:
                "تم تقييم المعاينه بنجاح",
              );
            });
          });
        },
        data: goTo,
      ),
    );

  }
}
