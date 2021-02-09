// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lutas/Bloc/auth_provider.dart';
// import 'package:lutas/helpers/screen_helper.dart';
// import 'package:lutas/ui/screen/Customer/home_customer.dart';
// import 'package:lutas/ui/screen/Drawer/drawer_screen/drawer_screen.dart';
// import 'package:lutas/ui/screen/Inspector/home_inspector.dart';
// import 'package:lutas/ui/screen/Plumber/home_screen.dart';
// import 'package:lutas/ui/screen/Plumber/points.dart';
// import 'package:lutas/ui/screen/Plumber/reserve_preview_plumber.dart';
// import 'package:lutas/ui/screen/Products/show_products_screen.dart';
// import 'package:lutas/ui/screen/ReportADamage/report_a_damage.dart';
// import 'package:lutas/ui/screen/Reporter_screen/Report_damage/report_damage_screen.dart';
// import 'package:lutas/ui/widget/cashing_sheet.dart';
// import 'package:lutas/ui/widget/custom_appBar.dart';
// import 'package:lutas/ui/widget/custom_button.dart';
// import 'package:lutas/ui/widget/custom_dialog.dart';
// import 'package:lutas/ui/widget/custom_text.dart';
// import 'package:lutas/ui/widget/custom_text_field.dart';
// import 'package:lutas/ui/widget/square_image_container.dart';
// import 'package:lutas/utils/constants.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:get/get.dart';
// import 'Pages_Nav/home.dart';
// import 'Pages_Nav/setting.dart';
//
//
//
// // enum user{
//
// //   customer, inspector, plumber
// // }
// class NavigationScreen extends StatefulWidget {
//   final AuthProvider _authProvider = Get.find() ;
//
//
//   @override
//   _NavigationScreenState createState() => _NavigationScreenState();
// }
// class _NavigationScreenState extends State<NavigationScreen> {
//
//   // bool isCustomer = false;
//   // bool isPlumber = true;
//   // bool isInspector = false;
//
//
//   List<Widget> buildPages(){
//     if(widget._authProvider.isPlumber.value){
//       return [HomeScreen(), Points(), ShowProductsScreen(), ReportDamage()];
//     }else if(widget._authProvider.isCustomer.value){
//       return [HomeCustomer(), ReportDamage()];
//     }else if(widget._authProvider.isInspector.value){
//       return [HomeInspector(), ReportDamageScreen()];
//     }
//   }
//
//
//   List<Widget> buildTabs(){
//     if(widget._authProvider.isPlumber.value){
//       return [
//         iconNav(
//           myIndex: 0,
//           title: 'الرئيسيه',
//           context: context,
//           icon: 'home.png',
//           onTap: () {
//             setState(() {
//               _myPage.jumpToPage(0);
//             });
//           },
//         ),
//         iconNav(
//           myIndex: 1,
//           title: 'النقاط',
//           margin: EdgeInsets.only(left: 20),
//           context: context,
//           icon: 'points.png',
//           onTap: () {
//             setState(() {
//               _myPage.jumpToPage(1);
//               // togglePage();
//             });
//           },
//         ),
//         iconNav(
//           myIndex: 2,
//           title: 'المنتجات',
//           margin: EdgeInsets.only(right: 20),
//           context: context,
//           icon: '3.png',
//           onTap: () {
//             setState(() {
//               _myPage.jumpToPage(2);
//               // togglePage();
//             });
//           },
//         ),
//         iconNav(
//           myIndex: 3,
//           title: 'الصيانه',
//           context: context,
//           icon: 'plumber.png',
//           onTap: () {
//             setState(() {
//               _myPage.jumpToPage(3);
//               // togglePage();
//             });
//           },
//         ),
//       ];
//     }else if(widget._authProvider.isCustomer.value){
//       return [
//         iconNav(
//           myIndex: 0,
//           title: 'الرئيسيه',
//           context: context,
//           icon: 'home.png',
//           onTap: () {
//             setState(() {
//               _myPage.jumpToPage(0);
//             });
//           },
//         ),
//
//         iconNav(
//           myIndex: 1,
//           title: 'الصيانه',
//           context: context,
//           icon: 'plumber.png',
//           onTap: () {
//             setState(() {
//               _myPage.jumpToPage(3);
//               // togglePage();
//             });
//           },
//         ),
//       ];
//
//     }else if(widget._authProvider.isInspector.value){
//       return [
//         iconNav(
//           myIndex: 0,
//           title: 'الرئيسيه',
//           context: context,
//           icon: 'home.png',
//           onTap: () {
//             setState(() {
//               _myPage.jumpToPage(0);
//             });
//           },
//         ),
//         iconNav(
//           myIndex: 1,
//           title: 'الصيانه',
//           context: context,
//           icon: 'plumber.png',
//           onTap: () {
//             setState(() {
//               _myPage.jumpToPage(3);
//             });
//           },
//         ),
//       ];
//     }
//   }
//
//   PageController _myPage = PageController(initialPage: 0);
//
//
//   var pageIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     print('_myPage $_myPage');
//
//
//     return Scaffold(
//       drawer: EndDrawer(),
//       appBar: customAppBar(context: context),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 6.0,
//                 spreadRadius: 0.4,
//                 offset: Offset(0.1, 0.5),
//                 color: ConstColors.GREY_COLOR,
//               ),
//             ],
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           height: 65,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: buildTabs(),
//             ),
//           ),
//         ),
//       ),
//       body: PageView(
//         controller: _myPage,
//         onPageChanged: (int) {
//           print('Page Changes to index $int ::${_myPage.page.toInt()}');
//           setState(() {
//             pageIndex = int;
//           });
//           if (int == _myPage.page.toInt()) {}
//           print('_myPage2 $_myPage');
//         },
//         children: buildPages(),
//         physics: NeverScrollableScrollPhysics(),
//       ),
//       floatingActionButton: Container(
//         height: ScreenHelper.screenHeight(context, 60),
//         width: ScreenHelper.screenWidth(context, 60),
//         child: FittedBox(
//           child: FloatingActionButton(
//             backgroundColor: ConstColors.ORANGE_COLOR,
//             onPressed: () {
//               if(widget._authProvider.isCustomer.value || widget._authProvider.isInspector.value){
//                 Get.to(ReservePreview());
//               }else
//               if (pageIndex == 1) {
//                 Get.bottomSheet(
//                   CashingSheet(title: 'اذن صرف النقاط'),
//
//                 );
//
//               } else
//                 Get.to(ReservePreview());
//             },
//             child: widget._authProvider.isCustomer.value ||widget._authProvider.isInspector.value ? Icon(
//               Icons.add,
//               color: Colors.white,
//             ): pageIndex == 1
//                 ? CustomText(
//                     text: 'صرف',
//                     color: ConstColors.WHITE,
//                     fontW: FW.bold,
//                   )
//                 : Icon(
//                     Icons.add,
//                     color: Colors.white,
//                   ),
//             // elevation: 5.0,
//           ),
//         ),
//       ),
//     );
//   }
//
//   iconNav(
//           {Function onTap,
//           BuildContext context,
//           String icon,
//           padding,
//           margin,
//           title,
//           myIndex}) =>
//       InkWell(
//         onTap: onTap,
//         child: Container(
//           margin: margin,
//           padding: padding,
//           // color: Colors.grey,
//           height: ScreenHelper.screenHeight(context, 50),
//           width: ScreenHelper.screenWidth(context, 50),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/img/icons/$icon',
//                 fit: BoxFit.contain,
//                 height: ScreenHelper.screenHeight(context, 25),
//                 width: ScreenHelper.screenWidth(context, 25),
//               ),
//               pageIndex == myIndex
//                   ? CustomText(
//                       text: '$title',
//                       color: ConstColors.ORANGE_COLOR,
//                     )
//                   : Container(),
//             ],
//           ),
//         ),
//       );
// }
