import 'package:ecommerce_app/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/Language/custombutton.dart';

class Language extends GetView<ChangeLocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1'.tr,style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height: 30),
            Custombutton(text: '39'.tr, onPressed: (){
              controller.changeLanguage('ar');
              // Get.toNamed(AppRoutes.onBoarding);
            }),
            Custombutton(text: '40'.tr, onPressed: (){
              controller.changeLanguage('en');
              // Get.toNamed(AppRoutes.onBoarding);
            }),
            
          ],
        ),
      ),
    );
  }
}