import 'package:get/get.dart';
import 'package:lotus/Bloc/models/notification_page_model.dart';
import '../repository/notification_page_repo.dart';

class NotificationsPageProvider extends GetxController {
  @override
  void onInit() {
    fetchNotifications();
    super.onInit();
  }

  RxBool loading = true.obs;

  var myNotifications = List<Notification>().obs;

  NotificationsPageRepo repo = NotificationsPageRepo();

  Future fetchNotifications() async {
    loading(true);
    try {

      NotificationModel data = await repo.notificationsPageRepo();

     print("data:::: ${data.notifications[0].data.data.title}");


      for(var item in data.notifications){

        myNotifications.add(item);

      }



      // print("myNotifications ::::::::::::::::::::: $myNotifications");

      loading(false);
    } catch (e) {
      print('fetchAbout ==? $e');
    }
  }
}
