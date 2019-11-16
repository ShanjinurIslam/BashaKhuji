import 'package:bashakhuji/model/userDetails.dart';
import 'package:bashakhuji/scopedModel/mainmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MyAds extends StatefulWidget {
  bool isCalled = false;
  final String userID;
  MyAds(this.userID);
  @override
  State<StatefulWidget> createState() {
    return MyAdState();
  }
}

class MyAdState extends State<MyAds> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      if (!widget.isCalled) {
        model.generateMyAds(widget.userID);
      }

      return !model.isMyAdLoaded
          ? Scaffold(
              body: Center(
              child: CupertinoActivityIndicator(),
            ))
          : Scaffold(
              body: Stack(
                children: <Widget>[Text('Loaded')],
              ),
            );
    });
  }
}
