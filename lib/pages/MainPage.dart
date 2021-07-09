import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GoogleMapController _controller;
  List<LatLng> coords;
  final _cameraPosition =
      CameraPosition(target: LatLng(5.6315, -0.2643), zoom: 16);
  List<Marker> markerList = [];
  List<Polyline> polylineList = [];
  GoogleMapPolyline _googleMapPolyline =
      GoogleMapPolyline(apiKey: "AIzaSyBEpI32ZFr_tzTpXg0mQgrR-arXRWP5nAU");

  void initState() {
    markerList.add(
      Marker(markerId: MarkerId("initial"), position: LatLng(5.6315, -0.2643)),
    );
    super.initState();
  }

  polylines(LatLng dest) async {
    coords = await _googleMapPolyline.getCoordinatesWithLocation(
        origin: LatLng(5.6315, -0.2643),
        destination: dest,
        mode: RouteMode.driving);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        
            child: GoogleMap(
            
                initialCameraPosition: _cameraPosition,
                mapType: MapType.normal,
                myLocationEnabled: true,
                onTap: (cordinate) {
                  _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
                  setState(() {
                    markerList.add(
                      Marker(markerId: MarkerId("second"), position: cordinate),
                    );
                  });
                },
                markers: Set.from(markerList),
                polylines: Set.from(polylineList),
                onMapCreated: (controller) {
                  setState(() {
                    _controller = controller;
                    polylineList.add(Polyline(
                        points: coords,
                        startCap: Cap.roundCap,
                        endCap: Cap.squareCap,
                        color: Colors.blue,
                        width: 3,
                        polylineId: PolylineId("first")));
                  });
                })));
  }
}
