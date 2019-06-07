import 'package:flutter/material.dart';
import '../pages/nearest_ps.dart';
import '../pages/directory_home.dart';
import '../pages/notifications.dart';
import '../pages/policebot.dart';
import '../pages/cug.dart';
import '../pages/report_call.dart';
import 'navigation.dart';

class Home extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new Navigation(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,

        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          );
        }),
        title: new Text(
          "Dial A Cop",
          style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => debugPrint('Cliced Search'),
          )
        ],
      ),
      body: GridView.count(
        padding: EdgeInsets.all(10.5),
        crossAxisCount: 2,
        children: <Widget>[
          new Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Directory_home()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                'asset/icons/directory.png',
                                height: 100,
                                width: 100,
                              ),
                              new Text(
                                "Directory",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          new Container(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Nearest_ps()),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      child: new Column(
                    children: <Widget>[
                      new Image.asset(
                        'asset/icons/nearestps.png',
                        height: 100,
                        width: 100,
                      ),
                      new Text(
                        "Nearest Police Station",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w800,
                            fontSize: 15),
                      )
                    ],
                  ))
                ],
              ),
            ),
          )),
          new Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'asset/icons/notification.png',
                      height: 100,
                      width: 100,
                    ),
                    new Text(
                      "Notificaiton",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
          new Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Policebot()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'asset/icons/policebot.jpg',
                      height: 100,
                      width: 100,
                    ),
                    new Text(
                      "Police Bot",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
          new Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cug()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'asset/icons/cug.png',
                      height: 100,
                      width: 100,
                    ),
                    new Text(
                      "CUG",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
          new Container(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Report_call()),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    'asset/icons/report.png',
                    height: 100,
                    width: 100,
                  ),
                  new Text(
                    "Report Sparm",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  )
                ],
              ),
            ),
          ))
        ],
      ),

    );
  }
}



