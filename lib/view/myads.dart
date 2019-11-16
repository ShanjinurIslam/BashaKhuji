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
                  top: 40,
                  left: 20,
                  child: Text('My Ads'),
                ),
                Positioned(
                    top: 40,
                    right: 20,
                    child: RaisedButton(
                        child: Text('Post an ad'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return CreateAd(
                                userId: widget.userID,
                              );
                            },
                          ));
                        })),
                Positioned(
                    top: MediaQuery.of(context).size.height * .3,
                    left: 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: listOfAds(model.myAds),
                    )),
              ],
            ));
    });
  }
}
