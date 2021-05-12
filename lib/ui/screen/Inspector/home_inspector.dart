import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Bloc/Controllers/Inspector/home_inspector_provider.dart';
import '../../../Bloc/Controllers/Notifications_Management/notifications_page_provider.dart';
import '../../../Bloc/Controllers/slider_adds_controller.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../globalWidget/NoSomethingYet.dart';
import '../../globalWidget/custom_loading.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_text.dart';
import '../../widget/slider_adds.dart';
import '../Drawer/drawer_screen/drawer_screen.dart';
import 'ReportPreview_inspector.dart';
import 'card_inspector.dart';
import 'details_inspector_preview.dart';

class HomeInspector extends StatefulWidget {
  @override
  _HomeInspectorState createState() => _HomeInspectorState();
}

class _HomeInspectorState extends State<HomeInspector>
    with SingleTickerProviderStateMixin {
  final SliderAddsController _sliderAddsController =
      Get.put(SliderAddsController());

  final HomeInspectorProvider home = Get.put(HomeInspectorProvider());

  final NotificationsPageProvider _notificationsPage =
      Get.put(NotificationsPageProvider());

  final List<Widget> myTabs = [
    Tab(
      child: CustomText(
        text: 'معاينات حالبه',
      ),
    ),
    Tab(
      child: CustomText(
        text: 'معاينات مكتمله',
      ),
    ),
  ];

  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // PushNotificationManger  _pushNotificationManger = PushNotificationManger();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);

    // _pushNotificationManger.configureCallback();

    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  GetStorage _box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String _userName = _box.read('name');
    return Scaffold(
      drawer: EndDrawer(),
      appBar: customAppBar(context: context),
      body: GetX<HomeInspectorProvider>(
          // init: HomeInspectorProvider(),
          // initState: (state) => HomeCategoryCustomerProvider().homeCustomerProvider(),
          builder: (controller) {
        return controller.homeLoading.value
            ? CustomLoading(bg: ConstColors.WHITE)
            : RefreshIndicator(
                color: ConstColors.ORANGE_COLOR,
                onRefresh: () async {
                  await controller.homeInspector();
                },
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                    const SizedBox(height: 15),
                    CustomText(
                      text: 'مرحبا !',
                      padding: EdgeInsets.only(right: 15),
                      fontSize: ScreenHelper.screenFont(context, 16),
                    ),
                    CustomText(
                      text: '$_userName',
                      fontW: FW.bold,
                      fontSize: ScreenHelper.screenFont(context, 20),
                      padding: EdgeInsets.only(right: 15, bottom: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 20),
                      child: SliderAdds(
                        slider: _sliderAddsController.sliderElement,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        TabBar(
                          unselectedLabelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: ConstColors.GREEN_COLOR,
                          tabs: myTabs,
                          controller: _tabController,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0.6),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: ConstColors.GREY_COLOR.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: [
                        controller.stillPreviews.length == 0
                            ? NoSomethingYet(
                                title: 'لا يوجد لديك معاينات حاليه!')
                            : ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => CardInspector(
                                  onTap: () {
                                    Get.to(ReportPreviewInspector(
                                        controller.stillPreviews[index]));
                                  },
                                  data: controller.stillPreviews[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10),
                                itemCount: controller.stillPreviews.length,
                              ),
                        controller.completePreview.length == 0
                            ? NoSomethingYet(
                                title: 'لم تقم بأتمام اي معاينه بعد!')
                            : ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => CardInspector(
                                  onTap: () {
                                    Get.to(DetailsInspectorPreview(
                                        controller.completePreview[index]));
                                  },
                                  data: controller.completePreview[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10),
                                itemCount: controller.completePreview.length,
                              ),
                      ][_tabController.index],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
      }),
    );
  }
}
