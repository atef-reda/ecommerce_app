import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdataresponse.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/favoritedata.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(String itemid, String value);
  addFavorite(String itemid);
  removeFavorite(String itemid);
}

class FavoriteControllerImpl extends FavoriteController {
  FavoriteData favoriteData = FavoriteData(crud: Get.find());
  Map<String, String> isFavorite = {};
  StatusRequest statusRequest = StatusRequest.none;
  @override
  addFavorite(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.favoriteAdd(
        Get.find<MyServices>().prefs!.getInt('id').toString(), itemid);
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          title: 'Success',
          message: 'Item added to favorite',
          // duration: Duration(seconds: 2)
        );
      } else {
        Get.rawSnackbar(
          title: 'Failure',
          message: 'Item not added to favorite',
          // duration: Duration(seconds: 2)
        );
        statusRequest = StatusRequest.failure;
      }
    }else{
        statusRequest = StatusRequest.failure;
    }
  }

  @override
  removeFavorite(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.favoriteRemove(
        Get.find<MyServices>().prefs!.getInt('id').toString(), itemid);
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          title: 'Success',
          message: 'Item removed from favorite',
          // duration: Duration(seconds: 2)
        );
      } else {
        Get.rawSnackbar(
          title: 'Failure',
          message: 'Item not removed from favorite',
          // duration: Duration(seconds: 2)
        );
        statusRequest = StatusRequest.failure;
      }
    }else{
        statusRequest = StatusRequest.failure;
    }
  }

  @override
  setFavorite(String itemid, String value) {
    if (value == '1') {
      addFavorite(itemid);
    } else {
      removeFavorite(itemid);
    }
    isFavorite[itemid] = value;
    update();
  }
}
