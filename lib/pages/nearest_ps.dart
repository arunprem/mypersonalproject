import 'dart:async';

import 'package:flutter/material.dart';

import 'package:location/location.dart';
import 'package:flutter/services.dart';

class Nearest_ps extends StatefulWidget {
  @override
  _Nearest_psState createState() => _Nearest_psState();
}

class _Nearest_psState extends State<Nearest_ps> {
  var location = new Location();

  Map<String, double> userLocation;
  
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              userLocation == null
                  ? CircularProgressIndicator()
                  : Text("Location is " +
                      "Latitude :" +
                      userLocation["latitude"].toString() +
                      " " +
                      " Longitude " +
                      userLocation["longitude"].toString()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    _getLocation().then((value) {
                      setState(() {
                        userLocation = value;
                      });
                    });
                  },
                  color: Colors.blueGrey,
                  child: Text(
                    "Get Location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
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
