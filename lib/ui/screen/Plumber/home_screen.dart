import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Bloc/Controllers/AddMaintenance/damage_types.dart';
import '../../../Bloc/Controllers/Gifts_Controller/get_gifts_provider.dart';
import '../../../Bloc/Controllers/Inspector/send_rate_preview_preview.dart';
import '../../../Bloc/Controllers/Notifications_Management/notifications_page_provider.dart';
import '../../../Bloc/Controllers/Plumber/home_provider_plumber.dart';
import '../../../Bloc/Controllers/slider_adds_controller.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../globalWidget/NoSomethingYet.dart';
import '../../globalWidget/card_customer.dart';
import '../../globalWidget/custom_loading.dart';
import '../../globalWidget/custom_snack_bar.dart';
import '../../globalWidget/customer_card_maintenance.dart';
import '../../globalWidget/gift_box.dart';
import '../../widget/card_menu.dart';
import '../../widget/custom_appBar.dart';
import '../../widget/custom_text.dart';
import '../../widget/slider_adds.dart';
import '../Drawer/drawer_screen/drawer_screen.dart';
import '../Products/show_products_screen.dart';
import '../ReportADamage/report_a_damage.dart';
import '../details_maintenance.dart';
import '../details_preview.dart';
import 'points.dart';
import 'reserve_preview_plumber.dart';

class HomeScreenPlumber extends StatefulWidget {
  @override
  _HomeScreenPlumberState createState() => _HomeScreenPlumberState();
}

class _HomeScreenPlumberState extends State<HomeScreenPlumber>
    with SingleTickerProviderStateMixin {
  final DamageTypesProvider _damageTypesProvider =
      Get.put(DamageTypesProvider());
  final SliderAddsController _sliderAddsController =
      Get.put(SliderAddsController());

  final HomeCategoryPlumberProvider _home =
      Get.put(HomeCategoryPlumberProvider());

  final SendRatePreviewProvider _sendRatePreviewProvider =
      Get.put(SendRatePreviewProvider());

  final NotificationsPageProvider _notificationsPage =
      Get.put(NotificationsPageProvider());
  final GetGiftsProvider _getGiftsProvider = Get.put(GetGiftsProvider());

  final List<Widget> myTabs = [
    Tab(
      child: CustomText(
        text: 'المعاينات',
      ),
    ),
    Tab(
      child: CustomText(
        text: 'الاعطال',
      ),
    ),
  ];

  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
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
    // loading();
    return Scaffold(
      drawer: EndDrawer(),
      appBar: customAppBar(context: context),
      body: GetX<HomeCategoryPlumberProvider>(
          // init: HomeCategoryPlumberProvider(),
          // initState: (state) => HomeCategoryPlumberProvider().homePlumberProvider(),
          builder: (controller) {
        // print(' controller.homeLoading.value  ;;;;;;;;  ${controller.homeLoading.value}');
        return controller.homeLoading.value
            ? CustomLoading(bg: ConstColors.WHITE)
            : RefreshIndicator(
                color: ConstColors.ORANGE_COLOR,
                onRefresh: () async {
                  await controller.homePlumberProvider();
                },
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'مرحبا !',
                                // padding: EdgeInsets.only(right: 16, top:15),
                                fontSize: ScreenHelper.screenFont(context, 15),
                              ),
                              CustomText(
                                text: '$_userName',
                                fontW: FW.bold,
                                fontSize: ScreenHelper.screenFont(context, 19),
                                // padding: EdgeInsets.only(right: 15, bottom: 8),
                              ),
                            ],
                          ),
                          GiftBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 20),
                      child: SliderAdds(
                        slider: _sliderAddsController.sliderElement,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardMenu(
                            icon: '0020.png',
                            title: 'طلب حجز معاينه',
                            onTap: () {
                              Get.to(ReservePreviewPlumber());
                            },
                          ),
                          CardMenu(
                            icon: '0040.png',
                            title: 'طلب صيانه',
                            onTap: () {
                              Get.to(ReportDamage(haveAppbar: true));
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardMenu(
                              icon: '0030.png',
                              title: 'اضافه نقاط',
                              onTap: () {
                                Get.to(Points(haveAppbar: true));
                              }),
                          CardMenu(
                              icon: '0010.png',
                              title: 'المنتجات',
                              onTap: () {
                                Get.to(ShowProductsScreen(haveAppbar: true));
                              }),
                        ],
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
                          tabs: [
                            Tab(
                              child: CustomText(
                                text: 'المعاينات',
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: 'الاعطال',
                              ),
                            ),
                          ],
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
                        controller.allPreview.length == 0
                            ? NoSomethingYet(
                                title: 'لم تقم بأضافه معاينات بعد!',
                              )
                            : ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => CardCustomer(
                                  onTap: () {
                                    if (controller
                                            .allPreview[index].statusActive ==
                                        0) {
                                      customSnackBar(
                                          title: "قيد التقديم",
                                          body:
                                              "لا يمكنك فتح هذه المعاينه ما ذالت قيد التقديم");
                                    } else {
                                      Get.to(
                                        DetailsPreview(
                                          onTapRate: () async {
                                            Get.dialog(CustomLoading(
                                                loadingText:
                                                    "جار ارسال تقييمك"));
                                            await _sendRatePreviewProvider
                                                .sendRatePreview(controller
                                                    .allPreview[index].id)
                                                .then((value) {
                                              _home
                                                  .homePlumberProvider()
                                                  .whenComplete(() {
                                                Get.back();
                                                Get.back();
                                                Get.back();
                                                customSnackBar(
                                                  title: "تقييم المعاينه",
                                                  body:
                                                      "تم تقييم المعاينه بنجاح",
                                                );
                                              });
                                            });
                                          },
                                          data: controller.allPreview[index],
                                        ),
                                      );
                                    }
                                  },
                                  data: controller.allPreview[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10),
                                itemCount: controller.allPreview.length,
                              ),
                        controller.allDamage.length == 0
                            ? NoSomethingYet(title: 'لم تقم بأضافه اعطال بعد!')
                            : ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    CardCustomerMaintenance(
                                  onTap: () {
                                    Get.to(DetailsMaintenance(
                                        controller.allDamage[index]));
                                  },
                                  data: controller.allDamage[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10),
                                itemCount: controller.allDamage.length,
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
