import 'package:bashakhuji/model/ad_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Ad ad;
  Details({this.ad});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Rent Details',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            'House Name:\t' + ad.houseName,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            'House Floor:\t' + ad.houseFloor,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            'Flat Number:\t' + ad.flatNumber,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            'Number of Beds:\t' + ad.numberOfBeds.toString(),
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            'Number of Toilets:\t' + ad.numberOfToilets.toString(),
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            'Address:\t' + ad.address,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            'Phone Number:\t' + ad.phoneNumber,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          RaisedButton(
            child: Text(
              'Back',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            elevation: 2.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      )),
    );
  }
}
