import 'package:ecommerce_app/controller/auth/successsignupcontroller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../widget/auth/customform.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImpl controller =
        Get.put(SuccessSignUpControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomTextTitleAuth(
              title: '32'.tr,
            ),
            SizedBox(height: 20),
            Icon(Icons.check_circle, color: AppColor.primaryColor, size: 200),
            SizedBox(height: 20),
            CustomTextBodyAuth(
              body: '28'.tr,
            ),
            Spacer(),
            CustomButtonAuth(
              text: '41'.tr,
              onPressed: () {
                controller.goToLogIn();
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
