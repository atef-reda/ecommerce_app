import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdataresponse.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cartdata.dart';

abstract class ItemDetialsController extends GetxController {
  getData();
  addCart();
  removeCart();
  addCartItems(String itemid);
  removeCartItems(String itemid);
  getCountItemCart(String itemid);
}

class ItemDetialsControllerImpl extends ItemDetialsController {
  CartData cartData = CartData(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  int itemCounts = 0;
  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];
  late ItemsModel itemsModel;
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    itemCounts = await getCountItemCart(itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  addCartItems(String itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartAdd(
        myServices.prefs!.getInt('id').toString(), itemid);
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          title: 'Success',
          message: 'Item added to cart',
          // duration: Duration(seconds: 2)
        );
      } else {
        Get.rawSnackbar(
          title: 'Failure',
          message: 'Item not added to cart',
          // duration: Duration(seconds: 2)
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeCartItems(String itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartRemove(
        myServices.prefs!.getInt('id').toString(), itemid);
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          title: 'Success',
          message: 'Item removed from cart',
          // duration: Duration(seconds: 2)
        );
      } else {
        Get.rawSnackbar(
          title: 'Failure',
          message: 'Item not removed from cart',
          // duration: Duration(seconds: 2)
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getCountItemCart(String itemid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartitemcounts(
        myServices.prefs!.getInt('id').toString(), itemid);
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        int itemCounts = response['data'];
        return itemCounts;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    print('onInit Get Data');
    await getData();
    super.onInit();
  }

  @override
  addCart() {
    itemCounts++;
    addCartItems(itemsModel.itemsId.toString());
    update();
  }

  @override
  removeCart() {
    if (itemCounts > 0) {
      itemCounts--;
      removeCartItems(itemsModel.itemsId.toString());
      update();
    }
  }
}
