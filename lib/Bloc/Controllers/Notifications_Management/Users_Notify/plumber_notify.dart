import 'package:get/get.dart';

import '../../../../ui/globalWidget/custom_loading.dart';
import '../../../../ui/globalWidget/custom_snack_bar.dart';
import '../../../../ui/screen/details_preview.dart';
import '../../Inspector/send_rate_preview_preview.dart';
import '../../Plumber/home_provider_plumber.dart';

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
          await _sendRatePreviewProvider.sendRatePreview(goTo.id).then((value) {
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
