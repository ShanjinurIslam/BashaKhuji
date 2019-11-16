import 'package:bashakhuji/model/ad_model.dart';
import 'package:bashakhuji/scopedModel/mainmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AllAds extends StatefulWidget {
  bool isCalled;
  @override
  State<StatefulWidget> createState() {
    return AllAdState();
  }
}

class AllAdState extends State<AllAds> {
  List<Ad> family;
  List<Ad> bachelor;
  List<Ad> sublet;

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text('Family'),
    1: Text('Bachelor'),
    2: Text('Sublet'),
  };

  int sharedValue = 0;

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

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      if (!widget.isCalled) {
        model.generateAds();
        family = model.family;
        bachelor = model.bachelor;
        sublet = model.sublet;
        model.isAdLoaded = true;
      }
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
    });
  }
}
