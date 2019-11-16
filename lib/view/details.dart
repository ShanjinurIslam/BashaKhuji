import 'package:bashakhuji/model/ad_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Ad ad;
  Details({this.ad});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Rent Details'),
          Text(ad.houseName),
          Text(ad.houseFloor),
          Text(ad.flatNumber),
          Text(ad.numberOfBeds.toString()),
          Text(ad.numberOfToilets.toString()),
          Text(ad.address),
          Text(ad.phoneNumber),
          RaisedButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
