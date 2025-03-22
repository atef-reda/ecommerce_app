import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logOut();
}

class SettingControllerImpl extends SettingsController {
  MyServices myServices = Get.find();
  @override
  logOut() {
    myServices.prefs!.clear();
    Get.offAllNamed(AppRoutes.language);
  }
}
