import 'package:flutter/material.dart';

class Cug extends StatefulWidget {
  @override
  _CugState createState() => _CugState();
}

class _CugState extends State<Cug> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: new Text("CUG"),
      ),
    );
  }
}
