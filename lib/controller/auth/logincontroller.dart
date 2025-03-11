import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/logindata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(crud: Get.find<Crud>());
  MyServices myServices = Get.find();
  @override
  goToSignUp() {
    Get.offAllNamed(AppRoutes.signUp);
  }

  @override
  login() async {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(
          email: emailController.text, password: passwordController.text);
      statusRequest = handlingDataResponse(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          myServices.prefs!.setInt('id', response['data']['users_id']);
          myServices.prefs!.setString('email', response['data']['users_email']);
          myServices.prefs!.setString('name', response['data']['users_name']);
          myServices.prefs!.setString('phone', response['data']['users_phone']);
          myServices.prefs!.setString('step', "2");
          Get.offAllNamed(AppRoutes.homepage);
        } else {
          Get.defaultDialog(title: '55'.tr, middleText: '58'.tr);
          statusRequest = StatusRequest.failure;
        }
      }
      else{
        // Get.defaultDialog(title: '55'.tr, middleText: '58'.tr);
        statusRequest = StatusRequest.none;
      }
    } else {
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
    FirebaseMessaging.instance.getToken().then((value) {
      // print('token is : $value');
    });
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
