import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Nearest_ps extends StatefulWidget {
  @override
  _Nearest_psState createState() => _Nearest_psState();
}

class _Nearest_psState extends State<Nearest_ps> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: new Text('Nearest Police Station'),
      ),
      body: Builder(
          builder: (context) => Stack(children: <Widget>[
                userLocation == null
                    ? new Center(
                        child: CircularProgressIndicator(),
                      )
                    : _googleMap(context),
                userLocation != null ? _buildContainer() : _showEroor(context)
              ])),
      floatingActionButton: new FloatingActionButton(
          tooltip: "Get My Location",
          backgroundColor: Colors.redAccent,
          child: new ListTile(
            title: Icon(Icons.my_location),
          ),
          onPressed: _goToCurrentLocation),
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
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

  Widget _showEroor(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
            child: Text("Get My Location"),
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Please enable the Location Service"),
                duration: Duration(seconds: 3),
              ));
            })
      ],
    );
  }

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }

  Marker psMarker = Marker(
      markerId: MarkerId("Museam Police Station"),
      position: LatLng(8.5095, 76.9568),
      infoWindow: InfoWindow(title: "Museam Police Station"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

  Marker psMarker2 = Marker(
      markerId: MarkerId("Vanitha Police Station"),
      position: LatLng(8.5065, 76.9568),
      infoWindow: InfoWindow(title: "Museam Police Station"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

  Future<void> _goToCurrentLocation() async {
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

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://media.istockphoto.com/vectors/the-police-car-opposite-the-of-the-police-station-vector-id886490230?k=6&m=886490230&s=612x612&w=0&h=WhEq9Gezl2_CVogYv-lxeZ0kzgZbFgMqbWVYVTXp4lY=",
                  8.5045,
                  76.9568,
                  "Museum PS"),
            ),
            SizedBox(
              width: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://media.istockphoto.com/vectors/the-police-car-opposite-the-of-the-police-station-vector-id886490230?k=6&m=886490230&s=612x612&w=0&h=WhEq9Gezl2_CVogYv-lxeZ0kzgZbFgMqbWVYVTXp4lY=",
                  8.5095,
                  76.9568,
                  "Cantonment PS"),
            ),
            SizedBox(
              width: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://media.istockphoto.com/vectors/the-police-car-opposite-the-of-the-police-station-vector-id886490230?k=6&m=886490230&s=612x612&w=0&h=WhEq9Gezl2_CVogYv-lxeZ0kzgZbFgMqbWVYVTXp4lY=",
                  8.5045,
                  76.9568,
                  "Vanitha PS"),
            )
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String policeStation) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer(policeStation),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer(String psname) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              psname,
              style: TextStyle(
                  color: Color(0xff6200ee),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "Email: serviceadmin.pol@kerala.gov.in",
                  style: TextStyle(color: Colors.black54, fontSize: 18.0),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "Mobile: 9495205259",
                  style: TextStyle(color: Colors.black54, fontSize: 18.0),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "VPN: 9495205259",
                  style: TextStyle(color: Colors.black54, fontSize: 18.0),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, long), zoom: 19, tilt: 50.0, bearing: 45.0)));
  }
}
