import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/resetpassworddata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/functions/handlingdataresponse.dart';

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
  StatusRequest statusRequest=StatusRequest.none;
  ResetPasswordData resetPasswordData =
      ResetPasswordData(crud: Get.find<Crud>());
  late String email;
  @override
  goToSuccessResetPassword() {
    Get.offAllNamed(AppRoutes.successResetPassword);
  }

  @override
  updatePassword() async {
    if (passwordController.text != confirmPasswordController.text) {
      return Get.defaultDialog(
        title: '55'.tr,
        middleText: '60'.tr,
      );
    }
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(
          email: email, password: passwordController.text);
      statusRequest = handlingDataResponse(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          goToSuccessResetPassword();
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
  togglePasswordShow() {
    showpassword ^= true;
    update();
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
