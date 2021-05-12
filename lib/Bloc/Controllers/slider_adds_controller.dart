import 'package:get/get.dart';

import '../models/sliderAddsModel.dart';
import '../repository/slider_adds_repo.dart';

class SliderAddsController extends GetxController {
  var sliderElement = List<SliderElement>().obs;

  @override
  void onInit() {
    fetchSliderAdds();
    super.onInit();
  }

  SliderAddsRepo _sliderAddsRepo = SliderAddsRepo();

  Future fetchSliderAdds() async {
    try {
      SliderAddsM _response = await _sliderAddsRepo.sliderRepo();

      for (var item in _response.slider) {
        sliderElement.add(item);
      }

      // print(' SLIDERRRRRRRRRRR data :::: ${sliderElement.length} ');

    } finally {
      // print(' finally data :::: ${sliderElement.length}  ${sliderElement} ');
    }
    // print("sdddddddddddddddddddddddddddddddddddd  ${sliderElement.length}");
  }
}
