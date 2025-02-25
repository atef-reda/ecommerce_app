import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogin();
  goTocheckEmail();
  goToVerifyCode();
  togglePasswordShow();
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool showpassword = true;
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  signup() {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      goToVerifyCode();
      print('valid');
    } else {
      print('not valid');
    }
    //to delete content of forms when exit from signup page
    //we can use lazy put instead of put to solve this problem
    // Get.delete<SignUpControllerImpl>();
  }

  @override
  goTocheckEmail() {
    Get.offAllNamed(AppRoutes.checkEmail);
  }

  @override
  goToVerifyCode() {
    Get.offAllNamed(AppRoutes.verifyCodeSignUp);
  }

  @override
  togglePasswordShow() {
    showpassword ^= true;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
