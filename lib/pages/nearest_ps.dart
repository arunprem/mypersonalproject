import 'dart:async';

import 'package:flutter/material.dart';

import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Nearest_ps extends StatefulWidget {
  @override
  _Nearest_psState createState() => _Nearest_psState();
}

class _Nearest_psState extends State<Nearest_ps> {
  var location = new Location();
  static Map<String, double> userLocation;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(

    target: LatLng(10.8505, 76.2711),
    zoom: 6.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(userLocation["latitude"], userLocation["longitude"]),
      tilt: 10.440717697143555,
      zoom: 19.151926040649414);



  
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
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Go To PS!'),
        icon: Icon(Icons.directions_boat),
      ),
    );

  }
  Future<void> _goToTheLake() async {
  // debugPrint(_kLake.toString());
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
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
