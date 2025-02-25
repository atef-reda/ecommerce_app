import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLogIn();
}

class SuccessResetPasswordControllerImpl extends SuccessResetPasswordController {
  @override
  goToLogIn() {
    Get.offAllNamed(AppRoutes.login);
  }
}
