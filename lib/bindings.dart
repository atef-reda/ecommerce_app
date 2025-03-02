import 'package:get/get.dart';

import 'controller/auth/logincontroller.dart';
import 'controller/auth/signupcontroller.dart';
import 'controller/onboardingcontroller.dart';
import 'core/class/crud.dart';

class MyBiniding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImpl(), fenix: true);
    Get.lazyPut(() => OnBordingControllerImpl(), fenix: true);
    Get.lazyPut(()=>LoginControllerImpl(), fenix: true);
    Get.lazyPut(()=>Crud(),fenix: true);
  }
}
