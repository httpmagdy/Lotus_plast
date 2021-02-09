// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:lutas/helpers/screen_helper.dart';
// import 'package:lutas/ui/globalWidget/colored_card.dart';
// import 'package:lutas/utils/constants.dart';
//
// class CustomSliderM {
//   final String name, phone, address;
//   final color;
//   CustomSliderM({this.name, this.phone, this.address, this.color});
// }
//
// class CustomSlider extends StatelessWidget {
//   final double height;
//   final List<CustomSliderM> listData;
//   CustomSlider({
//     this.height,
//     @required this.listData,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider.builder(
//       options: CarouselOptions(
//         // height: height ?? ScreenHelper.screenHeight(context, 135.0),
//         // aspectRatio: 16/9,
//         viewportFraction: 0.7,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 3),
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         // onPageChanged: callbackFunction,
//         scrollDirection: Axis.horizontal,
//       ),
//       itemCount: listData.length,
//       itemBuilder: (BuildContext context, int i) => ColordCard(
//         // : ConstColors.GREEN_COLOR,
//         bgColor: listData[i].color,
//         address: listData[i].address,
//         name: listData[i].name,
//         phone: listData[i].phone,
//       ),
//     );
//   }
// }
