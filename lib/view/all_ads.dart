import 'package:bashakhuji/components/rent_tile.dart';
import 'package:bashakhuji/model/ad_model.dart';
import 'package:bashakhuji/scopedModel/mainmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AllAds extends StatefulWidget {
  bool isCalled = false;
  int count = 0;
  @override
  State<StatefulWidget> createState() {
    return AllAdState();
  }
}

class AllAdState extends State<AllAds> {
  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text('Family'),
    1: Text('Bachelor'),
    2: Text('Sublet'),
  };

  int sharedValue = 0;

  static Widget listOfAds(List<Ad> ads) {
    return new ListView.builder(
        itemCount: ads.length,
        itemBuilder: (BuildContext ctxt, int index) =>
            RentTile(ad: ads[index]));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      if (!widget.isCalled && !model.isAdLoaded) {
        model.generateAds();
        widget.isCalled = true;
      }

      Map<int, Widget> map = new Map();
      map[0] = model.family.length > 0
          ? listOfAds(model.family)
          : Center(
              child: Text('No Family House Rent Available'),
            );
      map[1] = model.bachelor.length > 0
          ? listOfAds(model.bachelor)
          : Center(
              child: Text('No Bachelor House Rent Available'),
            );
      map[2] = model.sublet.length > 0
          ? listOfAds(model.sublet)
          : Center(child: Text('No Bachelor House Rent Available'));

      return Scaffold(
        body: !model.isAdLoaded
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : Stack(
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                        ),
                        child: map[sharedValue],
                      ),
                    ),
                  )
                ],
              ),
      );
    });
  }
}
