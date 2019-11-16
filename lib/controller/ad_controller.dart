import 'package:bashakhuji/api/ad_rest.dart';
import 'package:bashakhuji/model/ad_model.dart';

class AdController {
  AdRest rest = new AdRest();
  Future<List<Ad>> fetchAds() async {
    List<Ad> workouts = await rest.getData();
    return workouts;
  }

  Future<List<Ad>> fetchUserData(String userID) async {
    List<Ad> workouts = await rest.getUserData(userID);
    return workouts;
  }

  void uploadData(Ad ad) {
    Map<String, dynamic> dataObject = new Map();
    dataObject["userID"] = ad.userID;
    dataObject["flatNumber"] = ad.flatNumber;
    dataObject["houseName"] = ad.houseName;
    dataObject["houseFloor"] = ad.houseFloor;
    dataObject["catagory"] = ad.catagory;
    dataObject["address"] = ad.address;
    dataObject["rent"] = ad.rent;
    dataObject["numberOfBeds"] = ad.numberOfBeds;
    dataObject["numberOfToilets"] = ad.numberOfToilets;
    dataObject["phoneNumber"] = ad.phoneNumber;
    rest.createRecord(dataObject);
  }
}
