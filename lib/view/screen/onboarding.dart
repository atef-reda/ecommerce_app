import 'package:flutter/material.dart';
import '../widget/onboarding/cusstombutton.dart';
import '../widget/onboarding/customdotcontroller.dart';
import '../widget/onboarding/customslider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 3, child: CusstomOnboardingSlider()),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CusstomDotController(),
                  SizedBox(height: 60),
                  CusstomOnboardingButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
