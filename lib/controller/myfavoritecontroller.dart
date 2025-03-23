import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/data/datasource/remote/myfavoritedata.dart';
import 'package:ecommerce_app/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdataresponse.dart';

abstract class MyFavoriteController extends MixSearchController {
  getData();
  deleteItemFromFavorite(String id);
}

class MyFavoriteControllerImpl extends MyFavoriteController {
  MyFavoriteData myFavoriteData = MyFavoriteData(crud: Get.find());
  List favoriteItems = [];
  List<MyFavoriteModel> data = [];
  
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myFavoriteData
        .postdata( myServices.prefs!.getInt('id').toString());
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        favoriteItems.addAll(response['data']);
        data = favoriteItems.map((e) => MyFavoriteModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    getData();
    super.onInit();
  }
  
  @override
  deleteItemFromFavorite(String id) {
    myFavoriteData.deleteItem(id);
    data.removeWhere((element) => element.favoritesId.toString() == id);
    update();
  }
}
