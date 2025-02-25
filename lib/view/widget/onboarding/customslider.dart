import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';

class CusstomOnboardingSlider extends GetView<OnBordingControllerImpl> {
  const CusstomOnboardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<OnBordingControllerImpl>();
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: controller.onPageChanged,
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(height: 40),
            Image.asset(
              onBoardingList[index].image,
              height: Get.width / 1.2,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 40),
            Text(
              onBoardingList[index].title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              onBoardingList[index].description,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
