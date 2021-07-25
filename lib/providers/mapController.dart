import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shuttle_tracker/model/mapModel.dart';

class MapCotroller extends GetxController {
  var locationUpdate;
  StreamSubscription? _locationSubscription;
  Location _locationTracker = Location();
  GoogleMapController? mapController;

  final mapModel = MapModel().obs;

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  void getLocation() async {
    try {
      locationUpdate = await _locationTracker.getLocation();
      updateCircleAndMarker(locationUpdate);

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((localData) {
        mapModel.update((val) {
          val?.controller = mapController!.animateCamera(
              CameraUpdate.newCameraPosition(CameraPosition(
                  zoom: 20,
                  tilt: 0,
                  target: LatLng(localData.latitude as double,
                      localData.longitude as double)))) as GoogleMapController;
        });

        updateCircleAndMarker(localData);
      });
    } on PlatformException catch (e) {
      if (e.code == "PERMISSION_DENIED") {
        Get.snackbar("Permission Error", e.message as String);
      }
    }
  }

  void updateCircleAndMarker(LocationData data) {
    LatLng _latlng = LatLng(data.latitude as double, data.longitude as double);
    mapModel.update((val) {
      val?.cirlce = Circle(
          circleId: CircleId("circle"),
          center: _latlng,
          radius: data.accuracy as double,
          zIndex: 1,
          strokeColor: Colors.blue,
          strokeWidth: 15);
      val?.marker = Marker(
        markerId: MarkerId("marker"),
        zIndex: 2,
        position: _latlng,
      );
    });
  }
}
