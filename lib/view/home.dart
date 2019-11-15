import 'package:bashakhuji/model/userDetails.dart';
import 'package:bashakhuji/services/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  String userID;
  BaseAuth auth;

  @override
  void initState() {
    super.initState();
  }

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text('Family'),
    1: Text('Bachelor'),
    2: Text('Sublet'),
  };

  final Map<int, Widget> icons = const <int, Widget>{
    0: Center(
      child: FlutterLogo(
        colors: Colors.indigo,
        size: 200.0,
      ),
    ),
    1: Center(
      child: FlutterLogo(
        colors: Colors.teal,
        size: 200.0,
      ),
    ),
    2: Center(
      child: FlutterLogo(
        colors: Colors.cyan,
        size: 200.0,
      ),
    ),
  };

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    final UserDetails userDetails = ModalRoute.of(context).settings.arguments;
    userID = userDetails.userID;
    auth = userDetails.auth;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), title: Text('All Ads')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              title: Text('My Ads')),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(builder: (BuildContext context) {
          if (index == 0) {
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  Positioned(
                    top: 60,
                    left: 20,
                    child: Text(
                      'Avaliable Rents',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .2,
                    left: 0,
                    width: MediaQuery.of(context).size.width,
                    child: CupertinoSegmentedControl<int>(
                      children: logoWidgets,
                      onValueChanged: (int val) {
                        setState(() {
                          sharedValue = val;
                        });
                      },
                      groupValue: sharedValue,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .3,
                    left: 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .7,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 32.0,
                          horizontal: 16.0,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 64.0,
                            horizontal: 16.0,
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                          ),
                          child: icons[sharedValue],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          if (index == 1) {
            return Scaffold(
                body: Center(
              child: Text('Profile'),
            ));
          }
        });
      },
    );
  }
}
