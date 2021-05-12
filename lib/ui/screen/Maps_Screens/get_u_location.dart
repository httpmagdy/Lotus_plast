import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Bloc/Controllers/Maps_Controller/geolocator_u.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';

class GetUserLocation extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();

  // var dsa = double.parse(_getUserPosition.latitude);
  //
  //   CameraPosition _kGooglePlex = CameraPosition(
  //   target: _getUserPosition.latLonInit,
  //   zoom: 14.4746,
  // );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414,
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetUserPosition>(
        builder: (_getUserPosition) => GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target:
                LatLng(_getUserPosition.latitude, _getUserPosition.longitude),
            zoom: 19.151926040649414,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            Get.bottomSheet(
              MapDialog(_getUserPosition.currentAddress),
            );
          },
          markers: Set.from(_getUserPosition.markers),
          onTap: (arg) {
            print('${arg.longitude} ::::::::::::::');
            print('${arg.latitude} ::::::::::::::');

            _getUserPosition.onTapPosition(arg).whenComplete(
                  () => Get.bottomSheet(
                    MapDialog(_getUserPosition.currentAddress),
                  ),
                );
          },
        ),
      ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      //
      // ),
    );
  }

// Future<void> _goToTheLake() async {
//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// }
}

class MapDialog extends StatelessWidget {
  final GetUserPosition _getUserPosition = Get.find();

  final currentAddress;

  MapDialog(this.currentAddress);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 30),

      width: ScreenHelper.screenSize(context).width,
      // height: ScreenHelper.screenSize(context).height*0.2,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: ConstColors.WHITE,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 13, bottom: 20),
              width: 60,
              height: 3.8,
              decoration: BoxDecoration(
                  color: ConstColors.GREY_COLOR.withOpacity(.2),
                  borderRadius: BorderRadius.circular(50)),
            ),
            CustomText(
              text: 'عنوانك',
              fontSize: 16,
              fontW: FW.bold,
              padding: const EdgeInsets.only(bottom: 10),
            ),
            CustomText(
              text: '$currentAddress',
              // textAlign: TextAlign.start,
            ),
            Spacer(),
            SimpleCustomButton(
              outlineButton: true,
              text: "حفظ",
              bgColor: ConstColors.GREEN_COLOR,
              width: ScreenHelper.screenSize(context).width,
              onTap: () {
                if (_getUserPosition.currentAddress == "") {
                } else {
                  Get.back();
                  Get.back();
                }

                // await  _getUserPosition.saveAddress();
                // // await  _getUserPosition.determinePosition();
                // print('LLLLOCAAAATHON :::: ${_getUserPosition.currentAddress}');
                // Get.to(GetUserLocation());

                // Get.back();
                // Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
