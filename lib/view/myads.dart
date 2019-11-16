import 'package:bashakhuji/scopedModel/mainmodel.dart';
import 'package:bashakhuji/view/createAd.dart';
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
        widget.isCalled = true;
      }

      return !model.isMyAdLoaded
          ? Scaffold(
              body: Center(
              child: CupertinoActivityIndicator(),
            ))
          : Scaffold(
              body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                      child: Text('data'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return CreateAd(
                              userId: widget.userID,
                            );
                          },
                        ));
                      })));
    });
  }
}
