import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{
  SharedPreferences? prefs;
  Future<MyServices> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  intialServices() async {
    await Get.putAsync(()=>MyServices().init());
  }
}