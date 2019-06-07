import 'package:flutter/material.dart';

class Report_call extends StatefulWidget {
  @override
  _Report_callState createState() => _Report_callState();
}

class _Report_callState extends State<Report_call> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: new Text("Report Spam"),
      ),
    );
  }
}
