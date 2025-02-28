import 'package:get/get.dart';
import '../../core/constant/routes.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
  resendCode();
}


class VerifyCodeControllerImpl extends VerifyCodeController {
  @override
  goToResetPassword() {
    Get.offAllNamed(AppRoutes.resetPassword);
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