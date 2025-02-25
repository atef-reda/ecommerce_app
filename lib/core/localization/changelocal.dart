import 'package:ecommerce_app/core/constant/apptheme.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';

class ChangeLocalController extends GetxController {
  MyServices myServices = Get.find<MyServices>();
  Locale? language;
  ThemeData appTheme = themeEnglish;

  void changeLanguage(String languageCode) {
    language = Locale(languageCode);
    myServices.prefs!.setString('lang', languageCode);
    appTheme = languageCode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(language!);
    Get.toNamed(AppRoutes.onBoarding);
  }

  @override
  void onInit() {
    String? lang = myServices.prefs!.getString('lang');
    if (lang == 'ar') {
      language = Locale('ar');
      appTheme = themeArabic;
    } else if (lang == 'en') {
      language = Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Get.deviceLocale!;
      appTheme = language!.languageCode == 'ar' ? themeArabic : themeEnglish;
    }
    super.onInit();
  }
}
