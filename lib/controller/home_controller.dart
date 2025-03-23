import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/homedata.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdataresponse.dart';

abstract class HomeController extends MixSearchController {
  getData();
  initialData();
  goToFavorite();
  goToItems(int index, List categories, String categoriesId);
}

class HomeControllerImpl extends HomeController {
  late String email;
  late String name;
  late String phone;
  late int id;
  late String step;
  late String lang;
  List categories = [];
  List items = [];
  @override
  initialData() {
    email = myServices.prefs!.getString('email')!;
    id = myServices.prefs!.getInt('id')!;
    // phone = myServices.prefs!.getString('phone')!;
    // name = myServices.prefs!.getString('name')!;
    // step = myServices.prefs!.getString('step')!;
    lang = myServices.prefs!.getString('lang')!;
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    print('================StatusRequestloading====================');
    var response = await homeData.postdata();
    print('================postdata====================');
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      print('================StatusRequestsuccess====================');
      if (response['status'] == 'success') {
        print('================success====================');

        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  goToItems(int index, List categories, String categoriesId) {
    Get.toNamed(AppRoutes.itemsscreen, arguments: {
      'categories': categories,
      'selectetcat': index,
      'categoriesId': categoriesId
    });
  }

  @override
  goToFavorite() {
    Get.toNamed(AppRoutes.myfavorite);
  }
}

class MixSearchController extends GetxController {
  TextEditingController? searchController;
  bool isSearch = false;
  List<ItemsModel> searchData = [];
  List<MyFavoriteModel> searchDataFav = [];

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(crud: Get.find<Crud>());

  getSearchData(String table) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await homeData.searchData(searchController!.text, table);
    statusRequest = handlingDataResponse(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = [];
        searchData.clear();
        responseData = response['data'];
        if (table == "myfavorite") {
          searchDataFav.clear();
          searchDataFav.addAll(responseData
              .map<MyFavoriteModel>(
                  (element) => MyFavoriteModel.fromJson(element))
              .toList());
        } else {
          searchData.addAll(responseData
              .map<ItemsModel>((element) => ItemsModel.fromJson(element))
              .toList());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onChangeForm(String val) {
    statusRequest = StatusRequest.none;
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchPressed(String table) async {
    if (searchController!.text != "") {
      isSearch = true;
      await getSearchData(table);
      update();
    }
  }

  goToFavorites() {
    Get.toNamed(AppRoutes.myfavorite);
  }

  goToItemDetials(ItemsModel itemsModel) {
    Get.toNamed('/itemdetials', arguments: {'itemsModel': itemsModel});
  }
}
