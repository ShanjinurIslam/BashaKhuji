import 'package:bashakhuji/model/ad_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdRest {
  List<Ad> ads = [];
  List<Ad> myAds = [];
  final databaseReference = Firestore.instance;
  int count = 0;

  void createRecord(Map<String, dynamic> dataobject) async {
    print('In upload data');
    DocumentReference ref =
        await databaseReference.collection("ad_records").add(dataobject);
    print(ref.documentID);
  }

  Future<List<Ad>> getData() async {
    //Map<dynamic, dynamic> map;
    await databaseReference
        .collection("ad_records")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        Map<String, dynamic> dataObject = f.data;
        String userID;
        String flatNumber;
        String houseName;
        String houseFloor;
        String catagory;
        String address;
        int rent;
        int numberOfBeds;
        int numberOfToilets;
        String phoneNumber;

        userID = dataObject["userID"];
        flatNumber = dataObject["flatNumber"];
        houseName = dataObject["houseName"];
        houseFloor = dataObject["houseFloor"];
        catagory = dataObject["catagory"];
        address = dataObject["address"];
        rent = dataObject["rent"];
        numberOfBeds = dataObject["numberOfBeds"];
        numberOfToilets = dataObject["numberOfToilets"];
        phoneNumber = dataObject["phoneNumber"];
        Ad ad = new Ad(
            userID: userID,
            flatNumber: flatNumber,
            houseName: houseName,
            houseFloor: houseFloor,
            catagory: catagory,
            address: address,
            rent: rent,
            numberOfBeds: numberOfBeds,
            numberOfToilets: numberOfToilets,
            phoneNumber: phoneNumber);
        ads.add(ad);
      });
    });
    return ads;
  }

  Future<List<Ad>> getUserData(String userID) async {
    //Map<dynamic, dynamic> map;
    await databaseReference
        .collection("ad_records")
        .where('userID', isEqualTo: userID)
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        print(f);
        Map<String, dynamic> dataObject = f.data;
        String userID;
        String flatNumber;
        String houseName;
        String houseFloor;
        String catagory;
        String address;
        int rent;
        int numberOfBeds;
        int numberOfToilets;
        String phoneNumber;

        userID = dataObject["userID"];
        flatNumber = dataObject["flatNumber"];
        houseName = dataObject["houseName"];
        houseFloor = dataObject["houseFloor"];
        catagory = dataObject["catagory"];
        address = dataObject["address"];
        rent = dataObject["rent"];
        numberOfBeds = dataObject["numberOfBeds"];
        numberOfToilets = dataObject["numberOfToilets"];
        phoneNumber = dataObject["phoneNumber"];
        print(userID);
        Ad ad = new Ad(
            userID: userID,
            flatNumber: flatNumber,
            houseName: houseName,
            houseFloor: houseFloor,
            catagory: catagory,
            address: address,
            rent: rent,
            numberOfBeds: numberOfBeds,
            numberOfToilets: numberOfToilets,
            phoneNumber: phoneNumber);
        myAds.add(ad);
      });
    });
    return myAds;
  }
}
