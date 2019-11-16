import 'package:bashakhuji/model/ad_model.dart';
import 'package:bashakhuji/view/details.dart';
import 'package:flutter/material.dart';

class RentTile extends StatelessWidget {
  final Ad ad;

  RentTile({this.ad});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Details(
                ad: ad,
              );
            },
          ));
        },
        child: Card(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          elevation: 1.0,
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text(ad.houseName),
            subtitle: Text(ad.flatNumber + ' at Level ' + ad.houseFloor),
            dense: true,
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ),
    );
  }
}
