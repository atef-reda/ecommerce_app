import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware{
  @override
  int? get priority => 1;
  MyServices myServices=Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if(myServices.prefs!.getString('step')=='2'){
    return RouteSettings(name: AppRoutes.homepage);
    }
    if(myServices.prefs!.getString('step')=='1'){
    return RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}