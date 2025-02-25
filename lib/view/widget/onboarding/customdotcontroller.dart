import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CusstomDotController extends StatelessWidget {
  const CusstomDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControllerImpl>(
        init: OnBordingControllerImpl(),
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.all(5),
                width: controller.currentIndex == index ? 20 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          );
        });
  }
}
