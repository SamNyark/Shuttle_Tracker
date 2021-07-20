import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shuttle_tracker/authentication/firebaseController.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GoogleMapController? _controller;
  Circle? circle;
  Marker? marker;
  var locationUpdate;
  StreamSubscription? _locationSubscription;

  Location _locationTracker = Location();

  var _fcontroller = Get.find<FirebaseController>();

  void getLocation() async {
    try {

      locationUpdate = await _locationTracker.getLocation();
      updateCircle(locationUpdate);

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((localData) {
        setState(() {
          _controller!.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  zoom: 20,
                  tilt: 0,
                  target: LatLng(localData.latitude as double,
                      localData.longitude as double))));
        });
        updateCircle(localData);
      });
    } on PlatformException catch (e) {
      if (e.code == "PERMISSION_DENIED") {
        Get.snackbar("Permission Error", e.message as String);
      }
    }
  }

  void updateCircle(LocationData data) {
    LatLng _latlng = LatLng(data.latitude as double, data.longitude as double);
    this.setState(() {
      circle = Circle(
          circleId: CircleId("circle"),
          center: _latlng,
          radius: data.accuracy as double,
          zIndex: 1,
          strokeColor: Colors.blue,
          strokeWidth: 15);
      marker = Marker(
        markerId: MarkerId("marker"),
        zIndex: 2,
        position: _latlng,
      );
    });
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(locationUpdate.latitude, locationUpdate.longitude),
            zoom: 16),
        zoomControlsEnabled: false,
        circles: Set.of((circle != null) ? [circle!] : []),
        markers: Set.of((marker != null) ? [marker!] : []),
        onMapCreated: (GoogleMapController controller) {
          controller = _controller as GoogleMapController;
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow.shade800,
        onPressed: () {
          _fcontroller.signOut();
        }, //todo: map function
        child: Icon(
          Icons.zoom_out_map,
          size: 20,
        ),
      ),
    );
  }
}
