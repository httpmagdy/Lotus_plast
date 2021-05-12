import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../ui/globalWidget/custom_snack_bar.dart';
import '../../repository/maintenance_repo.dart';

class AddMaintenanceProvider extends GetxController {
  @override
  void onInit() {
    messageController = TextEditingController();
    super.onInit();
  }

  RxInt idTypeSelected = 0.obs;
  TextEditingController messageController;
  File image;

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

      if (image == null) {
        await _maintenanceRepo.addMaintenanceRepo(
          damageId: idTypeSelected.value,
          message: messageController.text,
        );
      } else {
        await _maintenanceRepo.addMaintenanceWithImageRepo(
          damageId: idTypeSelected.value,
          message: messageController.text,
          image: image,
        );
      }
    }
  }

  @override
  void dispose() {
    messageController = TextEditingController();
    super.dispose();
  }
}
