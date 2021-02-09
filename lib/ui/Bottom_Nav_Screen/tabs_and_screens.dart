//
// bool isCustomer = false;
// bool isPlumber = true;
// bool isInspector = false;
//
//
// List<Widget> buildPages(){
//   if(isPlumber){
//     return [HomeScreen(), Points(), ShowProductsScreen(), ReportDamage()];
//   }else if(isCustomer){
//     return [HomeCustomer(), ReportDamage()];
//
//   }else if(isInspector){
//     return [HomeScreen(), ReportDamage()];
//   }
// }
// List<Widget> buildTabs(){
//   if(isPlumber){
//     return [
//       iconNav(
//         myIndex: 0,
//         title: 'الرئيسيه',
//         context: context,
//         icon: 'home.png',
//         onTap: () {
//           setState(() {
//             _myPage.jumpToPage(0);
//           });
//         },
//       ),
//       iconNav(
//         myIndex: 1,
//         title: 'النقاط',
//         margin: EdgeInsets.only(left: 20),
//         context: context,
//         icon: 'points.png',
//         onTap: () {
//           setState(() {
//             _myPage.jumpToPage(1);
//             // togglePage();
//           });
//         },
//       ),
//       iconNav(
//         myIndex: 2,
//         title: 'المنتجات',
//         margin: EdgeInsets.only(right: 20),
//         context: context,
//         icon: '3.png',
//         onTap: () {
//           setState(() {
//             _myPage.jumpToPage(2);
//             // togglePage();
//           });
//         },
//       ),
//       iconNav(
//         myIndex: 3,
//         title: 'الصيانه',
//         context: context,
//         icon: 'plumber.png',
//         onTap: () {
//           setState(() {
//             _myPage.jumpToPage(3);
//             // togglePage();
//           });
//         },
//       ),
//     ];
//   }else if(isCustomer){
//     return [
//       iconNav(
//         myIndex: 0,
//         title: 'الرئيسيه',
//         context: context,
//         icon: 'home.png',
//         onTap: () {
//           setState(() {
//             _myPage.jumpToPage(0);
//           });
//         },
//       ),
//
//       iconNav(
//         myIndex: 3,
//         title: 'الصيانه',
//         context: context,
//         icon: 'plumber.png',
//         onTap: () {
//           setState(() {
//             _myPage.jumpToPage(3);
//             // togglePage();
//           });
//         },
//       ),
//     ];
//
//   }else if(isInspector){
//     return [
//       iconNav(
//         myIndex: 0,
//         title: 'الرئيسيه',
//         context: context,
//         icon: 'home.png',
//         onTap: () {
//           setState(() {
//             _myPage.jumpToPage(0);
//           });
//         },
//       ),
//
//       iconNav(
//         myIndex: 3,
//         title: 'الصيانه',
//         context: context,
//         icon: 'plumber.png',
//         onTap: () {
//           setState(() {
//             _myPage.jumpToPage(3);
//           });
//         },
//       ),
//     ];
//   }
// }
