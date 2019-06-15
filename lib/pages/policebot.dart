import 'package:flutter/material.dart';

import '../util/chatmessages.dart';

class Policebot extends StatefulWidget {
  @override
  _PolicebotState createState() => _PolicebotState();
}

class _PolicebotState extends State<Policebot> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: new Text('Police Bot'),
      ),
      body: ChatMessages(),
    );
  }
}

