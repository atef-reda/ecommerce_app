import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLogIn();
}

class SuccessSignUpControllerImpl extends SuccessSignUpController {
  @override
  goToLogIn() {
    Get.offAllNamed(AppRoutes.login);
  }
}
