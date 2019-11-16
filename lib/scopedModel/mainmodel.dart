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
    family.clear();
    bachelor.clear();
    sublet.clear();
    ads = await controller.fetchAds();
    for (int i = 0; i < ads.length/2; i++) {
      if (ads[i].catagory == 'family') {
        if (!family.contains(ads[i])) {
          family.add(ads[i]);
        }
      }
      if (ads[i].catagory == 'bachelor') {
        if (!bachelor.contains(ads[i])) {
          bachelor.add(ads[i]);
        }
      }
      if (ads[i].catagory == 'sublet') {
        if (!sublet.contains(ads[i])) {
          sublet.add(ads[i]);
        }
      }
    }
    isAdLoaded = true;
    notifyListeners();
  }

  void generateMyAds(String userID) async {
    myAds.clear();
    myAds = await controller.fetchUserData(userID);
    isMyAdLoaded = true;
    notifyListeners();
  }

  void uploadData(Ad ad) {
    print('I am here');
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
