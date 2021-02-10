import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lotus/Bloc/Controllers/AddMaintenance/damage_types.dart';
import 'package:lotus/Bloc/Controllers/Customer/home_provider_customer.dart';
import 'package:lotus/Bloc/Controllers/Inspector/send_rate_preview_preview.dart';
import 'package:lotus/Bloc/Controllers/slider_adds_controller.dart';
import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/globalWidget/NoSomethingYet.dart';
import 'package:lotus/ui/globalWidget/card_customer.dart';
import 'package:lotus/ui/globalWidget/custom_loading.dart';
import 'package:lotus/ui/globalWidget/customer_card_maintenance.dart';
import 'package:lotus/ui/screen/Drawer/drawer_screen/drawer_screen.dart';
import 'package:lotus/ui/screen/ReportADamage/report_a_damage.dart';
import 'package:lotus/ui/widget/card_menu.dart';
import 'package:lotus/ui/widget/custom_appBar.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/ui/widget/slider_adds.dart';
import 'package:lotus/utils/constants.dart';
import 'package:get/get.dart';
import '../details_maintenance.dart';
import '../details_preview.dart';
import '../../globalWidget/custom_snack_bar.dart';
import 'reserve_preview_customer.dart';

class HomeCustomer extends StatefulWidget {
  @override
  _HomeCustomerState createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer>
    with SingleTickerProviderStateMixin {
  final DamageTypesProvider _damageTypesProvider =
      Get.put(DamageTypesProvider());

  final SliderAddsController _sliderAddsController =
      Get.put(SliderAddsController());

  final HomeCategoryCustomerProvider _home =
      Get.put(HomeCategoryCustomerProvider());

  final SendRatePreviewProvider _sendRatePreviewProvider =
      Get.put(SendRatePreviewProvider());

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
    return Scaffold(
      drawer: EndDrawer(),
      appBar: customAppBar(context: context),
      body: GetX<HomeCategoryCustomerProvider>(
          // init: HomeCategoryCustomerProvider(),
          // initState: (state) => HomeCategoryCustomerProvider().homeCustomerProvider(),
          builder: (controller) {
        print(
            ' controller.homeLoading.value  ;;;;;;;;  ${controller.homeLoading.value}');
        return controller.homeLoading.value
            ? CustomLoading(bg: ConstColors.WHITE)
            : ListView(
                physics: BouncingScrollPhysics(),
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
                  // InspectBox(
                  //   onTap: () {
                  //     // Get.to(DetailsPreview()); /////////////
                  //   },
                  // ),
                  // const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 20),
                    child: SliderAdds(
                      slider: _sliderAddsController.sliderElement,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardMenu(
                          icon: '0020.png',
                          title: 'طلب حجز معاينه',
                          onTap: () {
                            Get.to(ReservePreviewCustomer());
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
                          ? NoSomethingYet(title: 'لم تقم بأضافه معاينات بعد !')
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
                                        body: "لا يمكنك فتح هذه المعاينه");
                                  } else {
                                    Get.to(
                                      DetailsPreview(
                                        onTapRate: () async {
                                          Get.dialog(CustomLoading(
                                              loadingText: "جار ارسال تقييمك"));
                                          await _sendRatePreviewProvider
                                              .sendRatePreview(controller
                                                  .allPreview[index].id)
                                              .then((value) {
                                            _home
                                                .homeCustomerProvider()
                                                .whenComplete(() {
                                              Get.back();
                                              Get.back();
                                              Get.back();
                                              customSnackBar(
                                                title: "تقييم المعاينه",
                                                body: "تم تقييم المعاينه بنجاح",
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
              );
      }),
    );
  }
}
