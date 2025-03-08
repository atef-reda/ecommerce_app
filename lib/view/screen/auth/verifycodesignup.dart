import 'package:ecommerce_app/controller/auth/verifycodesignupcontroller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/customotpfiledtext.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/auth/forgetpassword.dart';
// import '../../widget/auth/customform.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignupControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text('43'.tr),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: AppColor.grey),
      ),
      body: GetBuilder<VerifyCodeSignupControllerImpl>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: ListView(
              children: [
                CustomTextTitleAuth(title: '44'.tr),
                CustomTextBodyAuth(body: '45'.tr),
                const SizedBox(height: 30),
                CustomOtpFiledText(
                  onSubmit: (String code) {
                    controller.goToSuccessSignUp(code);
                  },
                ),
                const SizedBox(height: 30),
                CustomTextButton(
                    text: '46'.tr,
                    color: AppColor.primaryColor,
                    onTap: () {
                      controller.resendCode();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
