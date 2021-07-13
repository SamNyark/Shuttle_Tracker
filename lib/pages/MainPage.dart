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
  List<Marker> _marker = [];

  Location _locationTracker = Location();
  LocationData? newLocalData;
  CameraPosition _position =
      CameraPosition(target: LatLng(6.670242, -1.562808), zoom: 17);

  var _fcontroller = Get.find<FirebaseController>();

  void getLocation() async {
    try {
      await _locationTracker.getLocation();
      _marker.add(Marker(markerId: MarkerId("value"), position: LatLng(newLocalData!.latitude as double,
              newLocalData!.longitude as double)));
    } on PlatformException catch (e) {
      if (e.code == "PERMISSION_DENIED") {
        Get.snackbar("Permission Error", e.message as String);
      }
    }
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
        initialCameraPosition: _position,
        zoomControlsEnabled: false,
        markers: _marker.toSet(),
        onMapCreated: (GoogleMapController controller) {
          controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(newLocalData!.latitude as double,
              newLocalData!.longitude as double))));
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
