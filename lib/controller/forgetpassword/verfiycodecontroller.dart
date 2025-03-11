import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/verifycodedata.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdataresponse.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String code);
  goToResetPassword();
  resendCode();
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  StatusRequest statusRequest=StatusRequest.none;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(crud: Get.find<Crud>());
  late String email;

  @override
  goToResetPassword() {
    Get.offAllNamed(AppRoutes.resetPassword, arguments: {'email': email});
  }

  @override
  checkCode(String code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postdata(
        email: email, verifycode: code);
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        goToResetPassword();
      } else {
        Get.defaultDialog(
            title: '55'.tr,
            middleText: '57'.tr,);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  resendCode() {
  }
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
