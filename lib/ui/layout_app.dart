// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'file:///D:/PROJECTS/lutas/lib/Bloc/Auth_Controllers/auth_provider.dart';
//
// import 'screen/Customer/home_customer.dart';
// import 'screen/Inspector/home_inspector.dart';
// import 'screen/Plumber/home_screen.dart';
//
//
//
//
// class LayoutPage extends StatelessWidget {
//   final AuthProvider _authProvider = Get.put(AuthProvider()) ;
//
//   Widget buildPages(){
//     if(_authProvider.isPlumber.value){
//       return HomeScreenPlumber();
//     }else if(_authProvider.isCustomer.value){
//       return HomeCustomer();
//     }else if(_authProvider.isInspector.value){
//       return HomeInspector();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return buildPages();
//   }
// }
