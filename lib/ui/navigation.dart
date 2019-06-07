import 'package:flutter/material.dart';
import '../pages/report_call.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            //child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                image: AssetImage('asset/icons/dlogo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Card(
              child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: ()=>_onListTileTap(context),
          )),

          Card(
              child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          )),
          Card(
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
                onTap: () {
                  // Update the state of the app
                  // ...
                },
              )),
          Card(
              child: ListTile(
                leading: Icon(Icons.share),
                title: Text('Share App'),
                onTap: () {
                  // Update the state of the app
                  // ...
                },
              )),
          Card(
              child: ListTile(
                leading: Icon(Icons.play_arrow),
                title: Text('Credits'),
                onTap: () {
                  // Update the state of the app
                  // ...
                },
              )),
        ],
      ),
    );
  }

  _onListTileTap(BuildContext context) {
    Navigator.of(context).pop();
    showDialog<Null>(
      context: context,
      child: new AlertDialog(
        title: const Text('Not Implemented'),
        actions: <Widget>[
          new FlatButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
