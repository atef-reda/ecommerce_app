import 'package:get/get.dart';

import 'controller/auth/logincontroller.dart';
import 'controller/auth/signupcontroller.dart';
import 'controller/onboardingcontroller.dart';

class MyBiniding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImpl(), fenix: true);
    Get.lazyPut(() => OnBordingControllerImpl(), fenix: true);
    Get.lazyPut(()=>LoginControllerImpl(), fenix: true);
  }
}
