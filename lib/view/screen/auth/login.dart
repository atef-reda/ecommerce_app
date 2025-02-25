import 'package:ecommerce_app/controller/auth/logincontroller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/alertexitapp.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_app/view/widget/auth/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customform.dart';
import '../../widget/auth/dont_have_account.dart';
import '../../widget/auth/logo.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text('41'.tr),
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
        child: GetBuilder<LoginControllerImpl>(builder: (controller) {
          return Form(
            key: controller.formkey,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  CustomTextTitleAuth(title: '10'.tr),
                  CustomLogoAuth(),
                  CustomTextBodyAuth(body: '11'.tr),
                  const SizedBox(height: 30),
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
                  CustomTextButton(
                    text: '14'.tr,
                    color: AppColor.primaryColor,
                    onTap: () {
                      controller.goToForgetPassword();
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomButtonAuth(
                      text: '15'.tr,
                      onPressed: () {
                        controller.login();
                      }),
                  const SizedBox(height: 45),
                  DontHaveAccountText(
                    firstText: '16'.tr,
                    secondText: '17'.tr,
                    color: AppColor.primaryColor,
                    onTap: () {
                      controller.goToSignUp();
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
