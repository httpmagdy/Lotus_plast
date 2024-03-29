import 'package:get/get.dart';

import '../../models/home_inspector_model.dart';
import '../../repository/Inspector_Repo/home_inspector_repo.dart';

class HomeInspectorProvider extends GetxController {
  HomeInspectorRepo _homeInspectorRepo = HomeInspectorRepo();
  var stillPreviews = List<Complete>().obs;
  var completePreview = List<Complete>().obs;

  @override
  void onInit() {
    homeInspector();
    super.onInit();
  }

  RxBool homeLoading = true.obs;

  getInspectById(id) {
    Complete to = stillPreviews?.firstWhere((e) => e.id == id);

    print("TTTTTTo :::: $to");

    // return to;
    return to;
  }

  Future homeInspector() async {
    try {
      completePreview.clear();
      stillPreviews.clear();
      // homeLoading(true);

      HomeInspectorModel _response = await _homeInspectorRepo.inspectorRepo();

      for (var item in _response.stillpreviews) {
        stillPreviews.add(item);
      }

      for (var item in _response.complete) {
        completePreview.add(item);
      }
    } finally {
      homeLoading(false);

      // update();
      // print(' homeLoading  :::: ${homeLoading.value} ');
      print(' LEEEEEEEENTH all Damage :::: ${stillPreviews.length} ');
      print(' LEEEEEEEENTH all Preview :::: ${completePreview.length} ');

      // print(' finally data :::: ${stateFilter.length}  ${stateFilter} ');
    }
  }

  // @override
  // void onClose() {
  //
  //   super.onClose();
  // }

}
