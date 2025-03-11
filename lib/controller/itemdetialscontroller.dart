import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemDetialsController extends GetxController {
  getData();
}

class ItemDetialsControllerImpl extends ItemDetialsController {
  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];
  late ItemsModel itemsModel;
  @override
  getData() {
    itemsModel = Get.arguments['itemsModel'];
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
