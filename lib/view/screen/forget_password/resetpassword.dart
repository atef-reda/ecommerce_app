import 'package:ecommerce_app/controller/forgetpassword/resetpasswordcontroller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customform.dart';
// import '../../widget/auth/customform.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text('47'.tr),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: AppColor.grey),
      ),
      body: GetBuilder<ResetPasswordControllerImpl>(
        builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: Form(
                key: controller.formkey,
                child: ListView(
                  children: [
                    CustomTextTitleAuth(title: '35'.tr),
                    CustomTextBodyAuth(body: '34'.tr),
                    const SizedBox(height: 30),
                    CustomFormAuth(
                      obscureText: controller.showpassword,
                      onPressedIcon: () {
                        controller.togglePasswordShow();
                      },
                      validator: (val) {
                        return validInput(val!, 6, 30, 'password');
                      },
                      controller: controller.passwordController,
                      label: '35'.tr,
                      hint: '13'.tr,
                      icon: Icons.lock_outlined,
                    ),
                    CustomFormAuth(
                      obscureText: controller.showpassword,
                      onPressedIcon: () {
                        controller.togglePasswordShow();
                      },
                      validator: (val) {
                        return validInput(val!, 6, 30, 'password');
                      },
                      controller: controller.confirmPasswordController,
                      label: '49'.tr,
                      hint: '50'.tr,
                      icon: Icons.lock_outlined,
                    ),
                    const SizedBox(height: 30),
                    CustomButtonAuth(
                        text: '33'.tr,
                        onPressed: () {
                          controller.updatePassword();
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
