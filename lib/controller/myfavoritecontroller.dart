import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/myfavoritedata.dart';
import 'package:ecommerce_app/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdataresponse.dart';

abstract class MyFavoriteController extends GetxController {
  getData();
  deleteItemFromFavorite(String id);
}

class MyFavoriteControllerImpl extends MyFavoriteController {
  StatusRequest statusRequest = StatusRequest.none;
  MyFavoriteData myFavoriteData = MyFavoriteData(crud: Get.find());
  List favoriteItems = [];
  List<MyFavoriteModel> data = [];
  MyServices myServices = Get.find();
  
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
