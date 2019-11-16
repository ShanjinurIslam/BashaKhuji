import 'package:bashakhuji/components/rent_tile.dart';
import 'package:bashakhuji/model/ad_model.dart';
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
  static Widget listOfAds(List<Ad> ads) {
    return new ListView.builder(
        itemCount: ads.length,
        itemBuilder: (BuildContext ctxt, int index) =>
            RentTile(ad: ads[index]));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      if (!widget.isCalled && !model.isMyAdLoaded) {
        model.generateMyAds(widget.userID);
        widget.isCalled = true;
      }

      return !model.isMyAdLoaded
          ? Scaffold(
              body: Center(
              child: CupertinoActivityIndicator(),
            ))
          : Scaffold(
              body: Stack(
              children: <Widget>[
                Positioned(
                  top: 60,
                  left: 20,
                  child: Text(
                    'My Ads',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                Positioned(
                    top: 60,
                    right: 20,
                    child: SizedBox(
                        height: 60,
                        width: 100,
                        child: RaisedButton(
                            elevation: 2.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            color: Colors.blue,
                            child: Text(
                              'Post Ad',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return CreateAd(
                                    userId: widget.userID,
                                  );
                                },
                              ));
                            }))),
                Positioned(
                    top: MediaQuery.of(context).size.height * .2,
                    left: 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: model.myAds.length > 0
                          ? (model.myAds)
                          : Center(
                              child: Text('No Adds posted by you'),
                            ),
                    )),
              ],
            ));
    });
  }
}
