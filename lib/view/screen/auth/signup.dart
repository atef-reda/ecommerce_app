import 'package:ecommerce_app/controller/auth/signupcontroller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customform.dart';
import '../../widget/auth/dont_have_account.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text('42'.tr),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: AppColor.grey),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          alertExitApp();
        },
        child: GetBuilder<SignUpControllerImpl>(builder: (controller) {
          return HandlingDataRequest(statusRequest: controller.statusRequest, widget:  Form(
                  key: controller.formkey,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(title: '10'.tr),
                        CustomTextBodyAuth(body: '24'.tr),
                        const SizedBox(height: 30),
                        CustomFormAuth(
                          validator: (val) {
                            return validInput(val!, 4, 30, 'username');
                          },
                          controller: controller.usernameController,
                          label: '20'.tr,
                          hint: '23'.tr,
                          icon: Icons.person_outline,
                        ),
                        CustomFormAuth(
                          validator: (val) {
                            return validInput(val!, 12, 100, 'email');
                          },
                          controller: controller.emailController,
                          label: '18'.tr,
                          hint: '12'.tr,
                          icon: Icons.email_outlined,
                        ),
                        CustomFormAuth(
                          validator: (val) {
                            return validInput(val!, 10, 30, 'phone');
                          },
                          controller: controller.phoneController,
                          label: '21'.tr,
                          hint: '22'.tr,
                          icon: Icons.phone_outlined,
                        ),
                        CustomFormAuth(
                          obscureText: controller.showpassword,
                          onPressedIcon: () {
                            controller.togglePasswordShow();
                          },
                          validator: (val) {
                            return validInput(val!, 6, 30, 'password');
                          },
                          controller: controller.passwordController,
                          label: '19'.tr,
                          hint: '13'.tr,
                          icon: Icons.lock_outlined,
                        ),
                        // ForgetPassword(text: '14'.tr, color: AppColor.primaryColor,onTap: (){},),
                        const SizedBox(height: 30),
                        CustomButtonAuth(
                            text: '17'.tr,
                            onPressed: () {
                              controller.signup();
                            }),
                        const SizedBox(height: 45),
                        DontHaveAccountText(
                          firstText: '25'.tr,
                          secondText: '26'.tr,
                          color: AppColor.primaryColor,
                          onTap: () {
                            controller.goToLogin();
                          },
                        ),
                      ],
                    ),
                  ),
                ),);  
        }),
      ),
    );
  }
}
