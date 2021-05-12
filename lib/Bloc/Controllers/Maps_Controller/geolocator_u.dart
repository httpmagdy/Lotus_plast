import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// AddPreviewProvider addPreviewProvider =  Get.find();
// AddPreviewPlumberProvider addPreviewPlumberProvider =  Get.find();

class GetUserPosition extends GetxController {
  // @override
  // void onInit() {
  //   getCurrentLocation();
  //   super.onInit();
  // }

  // Position _currentPosition;
  var _currentAddress = "";
  get currentAddress => _currentAddress;

  var _latitude = 0.0;
  var _longitude = 0.0;

  get latitude => _latitude;
  get longitude => _longitude;

  var markers = <Marker>[];

  bool addressExist = false;

  // get initMarker => _markers;

  // LatLng latLonInit;

  //  saveAddress(){
  //    addPreviewProvider.addressController.text = _currentAddress;
  //    addPreviewPlumberProvider.addressController.text = _currentAddress;
  //    addressExist = true;
  //    update();
  //    print('_currentAddress :::.............. ${_currentAddress}');
  //    print(' addPreviewProvider.addressController.text ::>>>: ${ addPreviewProvider.addressController.text}');
  // }

  Future onTapPosition(LatLng arg) async {
    try {
      print('${arg.longitude} :::::: INSIDE ::::::::');
      print('${arg.latitude} ::::: : INSIDE ::::::::');
      // print("ON TTTTTTTTTTTTTTTTTTTTTAP ::: ${arg.l}" );
      print("${_currentAddress.toString()}    ::::: ONTAP ::::");

      await _getAddressFromLatLng(arg.latitude, arg.longitude);

      markers.clear();
      markers.add(
        Marker(
            markerId: MarkerId('SomeIdaa'),
            position: LatLng(arg.latitude, arg.longitude),
            infoWindow: InfoWindow(title: 'أنت متواجد هنا')),
      );

      update();
    } catch (e) {
      print("ERROR: onTapPosition() = $e");
    }
  }

  Future getCurrentLocation() async {
    try {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best)
          .then((Position position) async {
        _latitude = position.latitude;
        _longitude = position.longitude;
        markers.clear();
        markers.add(
          Marker(
            markerId: MarkerId('SomeId'),
            position: LatLng(position.latitude, position.longitude),
            infoWindow: InfoWindow(title: 'أنت متواجد هنا'),
          ),
        );
        await _getAddressFromLatLng(position.latitude, position.longitude);
        update();
      });
    } catch (e) {
      print("ERROR: getCurrentLocation() = $e");
    }
  }

  Future _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      final coordinates = new Coordinates(latitude, longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);

      print("<=((( ${addresses.first.adminArea} )))=>");
      print("<=((( ${addresses.first.locality} )))=>");
      print("<=((( ${addresses.first.countryCode} )))=>");
      print("<=((( ${addresses.first.subLocality} )))=>");
      print("<=((( ${addresses.first.thoroughfare} )))=>");
      print("<=((( ${addresses.first.postalCode} )))=>");
      print("<=((( ${addresses.first.countryName} )))=>");
      print("<=((( ${addresses.first.addressLine} )))=>");
      _currentAddress = "${addresses.first.addressLine}";
      // addPreviewProvider.addressController.text = "${addresses.first.addressLine}";
      print("<= $_currentAddress = >");

      update();
    } catch (e) {
      print("ERROR: _getAddressFromLatLng() = $e");
    }
  }
}

// Future _getAddressFromLatLng(double latitude, double longitude) async {
//   try {
//     List<Placemark> p = await placemarkFromCoordinates(latitude, longitude);
//     Placemark place = p[0];
//     _currentAddress = "${place.street}";
//
//     // print("_currentAddress :::::::      ${_currentAddress.toString()}    :::::::::");
//     // print("latitude :::::::      ${latitude.toString()}    :::::::::");
//     // print("longitude :::::::      ${longitude.toString()}    :::::::::");
//
//     update();
//
//   } catch (e) {
//     print("ERROR: _getAddressFromLatLng() = $e");
//
//   }
//
// }
