import 'package:bashakhuji/model/userDetails.dart';
import 'package:bashakhuji/services/authentication.dart';
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
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(userID),
          RaisedButton(
            onPressed: () {
              auth.signOut();
              Navigator.pop(context);
            },
            child: Text('Log Out'),
          )
        ],
      ),
    ));
  }
}
