import 'package:get_storage/get_storage.dart';
import 'Users_Notify/castomer_notify.dart';
import 'Users_Notify/inspector_notify.dart';
import 'Users_Notify/plumber_notify.dart';

class NotifyManage {
  GetStorage logged = GetStorage();

  Future<void> notifyManage({int id, String notifyType}) async {
    var typeUser = await logged.read("typeUser");

    print("#######typeUser########($typeUser)");
    print("#######notifyType########($notifyType)");

    if (notifyType == "public") {
      print("public Notification");
    } else {
      switch (typeUser) {
        case 0:
          print("###############(00000)######################");
          return PlumberNotify().plumberNotify(id);
          break;
        case 1:
          print("################(11111)#####################");
          return CustomerNotify().customerNotify(id);
          break;
        case 2:
          print("################(22222)#####################");
          return InspectorNotify().inspectorNotify(id);
          break;
      }
    }
  }
}
