import 'dart:async';

import 'package:flutter/material.dart';

import 'package:location/location.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Nearest_ps extends StatefulWidget {
  @override
  _Nearest_psState createState() => _Nearest_psState();
}

class _Nearest_psState extends State<Nearest_ps> {
  var location = new Location();
  static Map<String, double> userLocation;

  static final CameraPosition _Plocation = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(userLocation["latitude"], userLocation["longitude"]),
      tilt: 10.440717697143555,
      zoom: 19.151926040649414);
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {

    super.initState();
    _getLocation().then((value) {
      setState(() {
        userLocation = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: new Text('Nearest Police Station'),
      ),
      body: Stack(
        children: <Widget>[_googleMap(context)],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        tooltip: "get corrent location",
        label: Text("My Locaiton"),
        icon: Icon(Icons.my_location),
      ),
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(userLocation['latitude'].toDouble(),
                  userLocation['longitude'].toDouble()),
              zoom: 15),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {psMarker, psMarker2}),
    );
  }



  Marker psMarker = Marker(
      markerId: MarkerId("Museam Police Station"),
      position: LatLng(8.5095, 76.9568),
      infoWindow: InfoWindow(title: "Museam Police Station"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

  Marker psMarker2 = Marker(
      markerId: MarkerId("Vanitha Police Station"),
      position: LatLng(8.5045, 76.9568),
      infoWindow: InfoWindow(title: "Museam Police Station"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

  Future<void> _goToTheLake() async {
    // debugPrint(_Plocation.toString());
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_Plocation));
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
