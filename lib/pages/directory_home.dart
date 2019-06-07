import 'package:flutter/material.dart';

class Directory_home extends StatefulWidget {
  @override
  _Directory_homeState createState() => _Directory_homeState();
}

class _Directory_homeState extends State<Directory_home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: new Text("KP Directory"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () => debugPrint('Cliced Search'),
          )
        ],
      ),
    );
  }
}


