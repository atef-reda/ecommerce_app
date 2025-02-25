import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  updatePassword();
  goToSuccessResetPassword();
  togglePasswordShow();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool showpassword = true;

  @override
  goToSuccessResetPassword() {
    Get.offAllNamed(AppRoutes.successResetPassword);
  }

  @override
  updatePassword() {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      goToSuccessResetPassword();
    } else {}
  }

  @override
  togglePasswordShow() {
    showpassword ^= true;
    update();
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
