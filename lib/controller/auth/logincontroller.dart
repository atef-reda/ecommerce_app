import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/logindata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdataresponse.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  togglePasswordShow();
}

class LoginControllerImpl extends LoginController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool showpassword = true;
  StatusRequest? statusRequest;
  LoginData loginData = LoginData(crud: Get.find<Crud>());
  @override
  goToSignUp() {
    Get.offAllNamed(AppRoutes.signUp);
  }

  @override
  login() async{
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(
          email: emailController.text,
          password: passwordController.text);
      statusRequest = handlingDataResponse(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
              Get.offAllNamed(AppRoutes.homepage);
        } else {
          Get.defaultDialog(title: '55'.tr, middleText: '58'.tr);
          statusRequest = StatusRequest.failure;
        }
      }
      // else{
      //   Get.defaultDialog(title: '55'.tr, middleText: '58'.tr);
      //   statusRequest = StatusRequest.failure;
      // }
    } else {
      print('not valid');
    }
    update();
  }

  @override
  goToForgetPassword() {
    Get.offAllNamed(AppRoutes.forgetPassword);
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
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
