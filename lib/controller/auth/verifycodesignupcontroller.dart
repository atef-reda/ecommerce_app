import 'package:get/get.dart';
import '../../core/constant/routes.dart';

abstract class VerifyCodeSignupController extends GetxController {
  checkCode();
  goToSuccessSignUp();
  resendCode();
}


class VerifyCodeSignupControllerImpl extends VerifyCodeSignupController {
  @override
  goToSuccessSignUp() {
    Get.offAllNamed(AppRoutes.successSignUp);
  }

  @override
  checkCode() {
    // TODO: implement login
  }

    @override
  resendCode() {
    // TODO: implement resendCode
  }

  

}