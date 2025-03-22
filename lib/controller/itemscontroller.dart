import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/itemsData.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdataresponse.dart';

abstract class ItemsController extends GetxController {
  initialData();
  onCategoriesChange(int catSelected, String categoriesId);
  getData(String categoriesId);
  goToItemDetials(ItemsModel itemsModel);
  goToFavorites();
}

class ItemsControllerImpl extends ItemsController {
  List categories = [];
  List items = [];
  int? selectedCat;
  String? categoriesId;
  ItemsData itemsData = ItemsData(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectetcat'];
    categoriesId = Get.arguments['categoriesId'];
    getData(categoriesId!);
  }

  @override
  onCategoriesChange(int catSelected, categoriesId) {
    selectedCat = catSelected;
    getData(categoriesId);
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getData(String categoriesId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.postdata(categoriesId,myServices.prefs!.getInt('id').toString());
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItemDetials(ItemsModel itemsModel) {
    Get.toNamed('/itemdetials', arguments: {'itemsModel': itemsModel});
  }
  
  @override
  goToFavorites() {
    Get.toNamed(AppRoutes.myfavorite);
  }
}
