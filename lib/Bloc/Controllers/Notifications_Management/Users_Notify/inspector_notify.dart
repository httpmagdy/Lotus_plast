import 'package:lotus/Bloc/Controllers/Inspector/home_inspector_provider.dart';
import 'package:lotus/ui/screen/Inspector/ReportPreview_inspector.dart';
import 'package:get/get.dart';

class InspectorNotify {
  final HomeInspectorProvider _inspectorProvider = Get.find();

  void inspectorNotify(int id) {
    print("Inspector Notify ===========>");
    var goTo = _inspectorProvider.getInspectById(id);
    print(goTo.id);
    Get.to(ReportPreviewInspector(goTo));
  }
}
