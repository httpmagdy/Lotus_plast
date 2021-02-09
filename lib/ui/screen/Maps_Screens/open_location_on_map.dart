import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lotus/Bloc/Controllers/Maps_Controller/geolocator_u.dart';

import 'package:lotus/helpers/screen_helper.dart';
import 'package:lotus/ui/widget/custom_button.dart';
import 'package:lotus/ui/widget/custom_text.dart';
import 'package:lotus/utils/constants.dart';

class OpenLocationOnMsp extends StatefulWidget {
  // GetUserPosition _getUserPosition = Get.find();
  @override
  _OpenLocationOnMspState createState() => _OpenLocationOnMspState();
}

class _OpenLocationOnMspState extends State<OpenLocationOnMsp> {
  @override
  void initState() {
    _add();
    super.initState();
  }

  final Completer<GoogleMapController> _controller = Completer();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  void _add() {
    // var markerIdVal = MyWayToGenerateId();
    final MarkerId markerId = MarkerId('markerIdVal');

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(30.0444, 31.2357),
      // infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      // onTap: () {
      //   _onMarkerTapped(markerId);
      // },
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetUserPosition>(
        builder: (_getUserPosition) => GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(30.0444, 31.2357),
            zoom: 19.151926040649414,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(markers.values), // YOUR MARKS IN MAP
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
}
