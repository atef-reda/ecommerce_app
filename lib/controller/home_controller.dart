import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/homedata.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdataresponse.dart';

abstract class HomeController extends GetxController {
  getData();
  initialData();
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  late String email;
  late String name;
  late String phone;
  late int id;
  late String step;

  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(crud: Get.find<Crud>());
  List categories = [];
  List items = [];
  @override
  initialData() {
    email = myServices.prefs!.getString('email')!;
    id = myServices.prefs!.getInt('id')!;
    phone = myServices.prefs!.getString('phone')!;
    name = myServices.prefs!.getString('name')!;
    step = myServices.prefs!.getString('step')!;
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.postdata();
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }
}
