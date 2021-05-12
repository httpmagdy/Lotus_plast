import '../../Services/api_key.dart';
import '../../Services/network_services.dart';
import '../models/sliderAddsModel.dart';

class SliderAddsRepo extends NetworkService {
  Future<SliderAddsM> sliderRepo() async {
    var _response = await get(url: ApiKey.sliderURL, hasHeader: true);

    print(' sliderRepo s t a t s   :::: ${_response.statusCode}');

    return SliderAddsM.fromJson(_response.data);
  }
}
