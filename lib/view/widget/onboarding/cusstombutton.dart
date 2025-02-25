import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../../core/constant/color.dart';

class CusstomOnboardingButton extends GetView<OnBordingControllerImpl> {
  const CusstomOnboardingButton({super.key});
  @override
  Widget build(BuildContext context) {
  Get.find<OnBordingControllerImpl>();
    return Container(
      width: 230,
      height: 45,
      color: AppColor.primaryColor,
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        child: Text(
          '8'.tr,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
