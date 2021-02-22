import 'package:get/get.dart';
import 'package:lotus/Bloc/models/getgifts_model.dart';
import 'package:lotus/Bloc/repository/Gifts_Repo/get_gifts_repo.dart';

class GetGiftsProvider extends GetxController {

  @override
  void onInit() {
    getGiftsProvider();
    super.onInit();
  }

  var nuOfMaintenance = 0.obs;
  var listOfGifts = List<Gift>().obs;
  RxBool status = true.obs;

  GetGiftsRepo _getGiftsRepo = GetGiftsRepo();

  Future getGiftsProvider() async {

    status(true);

    GetGifts _data = await _getGiftsRepo.getGiftsRepo();

    nuOfMaintenance.value = _data.nuOfMaintenance;

    for (var item in _data.gifts) {
      listOfGifts.add(item);
      // update();
    }

    status(false);



    print('get Gifts Repo => statusCode : ${nuOfMaintenance}');
    print('addMaintenanceRepo => data : ${listOfGifts.length}');
  }
}
