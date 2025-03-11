import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/verifycodesignupdata.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdataresponse.dart';

abstract class VerifyCodeSignupController extends GetxController {
  checkCode();
  goToSuccessSignUp(String code);
  resendCode();
}

class VerifyCodeSignupControllerImpl extends VerifyCodeSignupController {
  StatusRequest statusRequest=StatusRequest.none;
  VerifyCodeSignUpData verifyCodeSignUpData =
      VerifyCodeSignUpData(crud: Get.find<Crud>());
  late String email;

  @override
  goToSuccessSignUp(String code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeSignUpData.postdata(email: email, verifycode: code);
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.successSignUp);
      } else {
        Get.defaultDialog(
            title: '55'.tr,
            middleText: '57'.tr,
           );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  checkCode() {
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
