import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/controller/get_user_location_controller.dart';

class AddLocation extends StatelessWidget {
  AddLocation({Key? key}) : super(key: key);
  // final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
        Get.find<GetUserLoctionController>().position?.latitude ?? 0.0,
        Get.find<GetUserLoctionController>().position?.longitude ?? 0.0),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      child: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          // _controller.complete(controller);
        },
        onTap: (position) {
          print(position.latitude);
          print(position.longitude);
        },
      ),
    );
  }
}
