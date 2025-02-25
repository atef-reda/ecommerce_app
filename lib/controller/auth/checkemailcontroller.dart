import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToVerifyCodeSignUp();
}


class CheckEmailControllerImpl extends CheckEmailController {
  late TextEditingController emailController;
  @override
  goToVerifyCodeSignUp() {
    Get.offAllNamed(AppRoutes.verifyCodeSignUp);
  }

  @override
  checkEmail() {
    // TODO: implement login
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