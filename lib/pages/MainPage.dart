import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shuttle_tracker/authentication/firebaseController.dart';
import 'package:shuttle_tracker/providers/mapController.dart';

class MainPage extends StatelessWidget {
  final _fcontroller = Get.find<FirebaseController>();
  final MapCotroller mapController = Get.put(MapCotroller()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(mapController.locationUpdate.latitude, mapController.locationUpdate.longitude),
            zoom: 16),
        zoomControlsEnabled: false,
        circles: Set.of((mapController.mapModel.value.cirlce != null) ? [mapController.mapModel.value.cirlce!] : []),
        markers: Set.of((mapController.mapModel.value.marker != null) ? [mapController.mapModel.value.marker!] : []),
        onMapCreated: (GoogleMapController controller) {
          controller = mapController.mapModel.value.controller as GoogleMapController;
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
