import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

traslationDataBase({required String arColumn, required String enColumn}) {
  MyServices myServices = Get.find();
  if (myServices.prefs!.getString('lang') == 'en') {
    return enColumn;
  } else if (myServices.prefs!.getString('lang') == 'ar') {
    return arColumn;
  } else {
    return enColumn;
  }
}
