import 'package:bashakhuji/model/userDetails.dart';
import 'package:bashakhuji/services/authentication.dart';
import 'package:bashakhuji/view/all_ads.dart';
import 'package:bashakhuji/view/myads.dart';
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
            return AllAds();
          }
          if (index == 1) {
            return MyAds(userID);
          }
        });
      },
    );
  }
}
