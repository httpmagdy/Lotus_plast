import 'package:get/get.dart';

import '../../models/notification_page_model.dart';
import '../../repository/notification_page_repo.dart';

class NotificationsPageProvider extends GetxController {
  @override
  void onInit() {
    fetchNotifications();
    super.onInit();
  }

  RxBool loading = true.obs;

  var myNotifications = List<Notification>().obs;
  RxBool status = true.obs;

  NotificationsPageRepo repo = NotificationsPageRepo();

  Future<void> fetchNotifications() async {
    loading(true);
    try {
      myNotifications.clear();

      NotificationModel data = await repo.notificationsPageRepo();

      status.value = data?.status;

      if (data.status == false) {
        print("NO Notifications ::::::::::::::::::::: ${data.status}");
        // myNotifications.clear();
        loading(false);
      } else {
        print("Have Notifications ::::::::::::::::::::: ${data.status}");

        // print("data:::: ${data.notifications[0].data.data.title}");
        // myNotifications.clear();

        for (var item in data.notifications) {
          myNotifications.add(item);
        }
      }

      loading(false);

      print(" status :::: $status");
    } catch (e) {
      print('Fetch Notifications == (ERROR) ==> $e');
    }
  }

  @override
  void onClose() {
    myNotifications.clear();
    super.onClose();
  }
}
