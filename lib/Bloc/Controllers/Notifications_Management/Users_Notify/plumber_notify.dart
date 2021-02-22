import 'package:get/get.dart';
import 'package:lotus/Bloc/Controllers/Inspector/send_rate_preview_preview.dart';
import 'package:lotus/Bloc/Controllers/Plumber/home_provider_plumber.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/globalWidget/custom_snack_bar.dart';
import 'package:lotus/ui/screen/details_preview.dart';

class PlumberNotify {
  final HomeCategoryPlumberProvider _plumberProvider = Get.find();
  final SendRatePreviewProvider _sendRatePreviewProvider = Get.find();

  void plumberNotify(int id) {

    print("Inspector Notify ===========>");





    var goTo = _plumberProvider.getPreviewById(id);
    print(goTo.id);


    Get.to(
      DetailsPreview(
        onTapRate: () async {
          Get.dialog(
            CustomLoading(
              loadingText: "جار ارسال تقييمك",
            ),
          );
          await _sendRatePreviewProvider
              .sendRatePreview(goTo.id)
              .then((value) {
            _plumberProvider.homePlumberProvider().whenComplete(() {
              Get.back();
              Get.back();
              Get.back();
              customSnackBar(
                title: "تقييم المعاينه",
                body: "تم تقييم المعاينه بنجاح",
              );
            });
          });
        },
        data: goTo,
      ),
    );


  }
}
