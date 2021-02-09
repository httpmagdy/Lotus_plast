import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotus/Bloc/repository/maintenance_repo.dart';
import 'package:lotus/ui/globalWidget/custom_snack_bar.dart';

class AddMaintenanceProvider extends GetxController {
  // var allDamageTypes = List<Datum>();

  @override
  void onInit() {
    messageController = TextEditingController();
    super.onInit();
  }

  RxInt idTypeSelected = 0.obs;
  TextEditingController messageController;

  void getIdType(listTypes, value) {
    idTypeSelected.value = listTypes.firstWhere((e) => e.name == value).id;
    print('allDamageTypes $listTypes');
    print('idTypeSelected $idTypeSelected');
  }

  final MaintenanceRepo _maintenanceRepo = MaintenanceRepo();

  Future<void> addMaintenance() async {
    if (idTypeSelected.value == 0) {
      customSnackBar(
        title: 'نوع العطل',
        body: 'من فضلك اختر نوع العطل',
      );
    } else {
      // globalKeyMaintenance.currentState.save();
      await _maintenanceRepo.addMaintenanceRepo(
        damageId: idTypeSelected.value,
        message: messageController.text,
      );
    }
  }

  // File _image;
  // final picker = ImagePicker();
  //
  // Future getImage() async {
  //   final image = await picker.getImage(source: ImageSource.camera);
  //
  //   // setState(() {
  //     if (image != null) {
  //       _image = File(image.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //     update();
  //   // });
  // }

  @override
  void dispose() {
    messageController = TextEditingController();
    super.dispose();
  }
}
