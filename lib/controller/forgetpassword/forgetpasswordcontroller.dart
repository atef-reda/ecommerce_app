import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/functions/handlingdataresponse.dart';
import '../../data/datasource/remote/forgetpassword/forgetpassword.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController emailController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  StatusRequest statusRequest=StatusRequest.none;
  ForgetPasswordData forgetPasswordData =
      ForgetPasswordData(crud: Get.find<Crud>());
  @override
  goToVerfiyCode() {
    Get.offAllNamed(AppRoutes.verifyCode,arguments: {'email':emailController.text});
  }

  @override
  checkEmail() async {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.postdata(
        email: emailController.text,
      );
      statusRequest = handlingDataResponse(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          goToVerfiyCode();
        } else {
          Get.defaultDialog(title: '55'.tr, middleText: '59'.tr);
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      // print('not valid');
    }
    update();
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
