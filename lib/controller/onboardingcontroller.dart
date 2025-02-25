import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBordingControllerImpl extends OnBordingController {
  late PageController pageController;
  MyServices myServices = Get.find();
  int currentIndex = 0;

  @override
  next() {
    currentIndex++;
    if (currentIndex > onBoardingList.length - 1) {
      myServices.prefs!.setString('onboarding', '1');
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentIndex,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
