import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController emailController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  goToVerfiyCode() {
    Get.offAllNamed(AppRoutes.verifyCode);
  }

  @override
  checkEmail() {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      goToVerfiyCode();
    } else {}
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
