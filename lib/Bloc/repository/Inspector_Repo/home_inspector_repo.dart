import '../../../Services/api_key.dart';
import '../../../Services/network_services.dart';
import '../../models/home_inspector_model.dart';

class HomeInspectorRepo extends NetworkService {
  Future<HomeInspectorModel> inspectorRepo() async {
    try {
      var _request = await get(
        url: ApiKey.inspectorHomeURL,
        hasHeader: true,
      );

      print(
          ' HomeInspectorModel =================== :::: ${_request.statusCode}');
      // print(' HomeInspectorModel :::: ${_request.data}');

      return HomeInspectorModel.fromJson(_request.data);
    } finally {}
  }
}
