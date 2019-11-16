import 'package:bashakhuji/controller/ad_controller.dart';
import 'package:bashakhuji/model/ad_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  List<Ad> family = [];
  List<Ad> bachelor = [];
  List<Ad> sublet = [];
  List<Ad> ads = [];
  List<Ad> myAds = [];

  AdController controller = new AdController();

  bool isAdLoaded = false;
  bool isMyAdLoaded = false;

  void generateAds() async {
    ads.clear();
    ads = await controller.fetchAds();
    for (int i = 0; i < ads.length; i++) {
      if (ads[i].catagory == 'family') {
        family.add(ads[i]);
      }
      if (ads[i].catagory == 'bachelor') {
        bachelor.add(ads[i]);
      }
      if (ads[i].catagory == 'sublet') {
        sublet.add(ads[i]);
      }
    }

    //isAdLoaded = true;
    notifyListeners();
  }

  void generateMyAds(String userID) async {
    myAds.clear();
    myAds = await controller.fetchUserData(userID);
    isMyAdLoaded = true;
    notifyListeners();
  }

  void uploadData(Ad ad) {
    controller.uploadData(ad);
    myAds.add(ad);
    if (ad.catagory == 'family') {
      family.add(ad);
    }
    if (ad.catagory == 'bachelor') {
      bachelor.add(ad);
    }
    if (ad.catagory == 'sublet') {
      sublet.add(ad);
    }
    notifyListeners();
  }
}
