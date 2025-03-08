import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/signupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/functions/handlingdataresponse.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogin();
  goTocheckEmail();
  togglePasswordShow();
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  StatusRequest statusRequest=StatusRequest.none;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  SignUpData signUpData = SignUpData(crud: Get.find<Crud>());
  bool showpassword = true;
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  signup() async {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postdata(
          username: usernameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text);
      statusRequest = handlingDataResponse(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
              Get.offAllNamed(AppRoutes.verifyCodeSignUp,arguments: {'email':emailController.text});
        } else {
          Get.defaultDialog(title: '55'.tr, middleText: '56'.tr);
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      print('not valid');
    }
    update();

    //to delete content of forms when exit from signup page
    //we can use lazy put instead of put to solve this problem
    // Get.delete<SignUpControllerImpl>();
  }

  @override
  goTocheckEmail() {
    Get.offAllNamed(AppRoutes.checkEmail);
  }

  @override


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
