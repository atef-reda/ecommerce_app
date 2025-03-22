import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/data/datasource/remote/cartdata.dart';
import 'package:ecommerce_app/data/model/cartmodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdataresponse.dart';
import '../core/services/services.dart';

abstract class CartController extends GetxController {
  addCart(String itemid);
  removeCart(String itemid);
  getCountItemCart(String itemid);
  cartViewData();
  resetCart();
  refershCart();
}

class CartControllerImpl extends CartController {
  CartData cartData = CartData(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  double totalprice = 0;
  int totalcount = 0;
  @override
  addCart(String itemid) async {
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
    refershCart();
    update();
  }

  @override
  removeCart(String itemid) async {
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
    refershCart();
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
  cartViewData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.cartView(myServices.prefs!.getInt('id').toString());
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data']['status'] == 'success') {
        List dataresponse = response['data']['data'];
        data.addAll(
            dataresponse.map((item) => CartModel.fromJson(item)).toList());
        if (response['countprice'] != false) {
          totalprice =
              (response['countprice']['totalprice'] as num?)!.toDouble();
          totalcount = response['countprice']['totalcount'];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    cartViewData();
    super.onInit();
  }

  @override
  resetCart() {
    data.clear();
    totalprice = 0.0;
    totalcount = 0;
  }

  @override
  refershCart() {
    resetCart();
    cartViewData();
  }
}
