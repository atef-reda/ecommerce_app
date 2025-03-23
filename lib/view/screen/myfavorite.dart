import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/myfavoritecontroller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/data/model/myfavoritemodel.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/applinks.dart';
import '../widget/favorite/customfavoritelist.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImpl());
    return Scaffold(
        body: GetBuilder<MyFavoriteControllerImpl>(
      builder: (controller) => Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            CustomAppar(
              mycontroller: controller.searchController!,
              onChangedForm: (val) {
                controller.onChangeForm(val);
              },
              hintText: '61'.tr,
              onPressedFavorite: () {
                controller.goToFavorites();
              },
              onPressedSearch: () {
                controller.onSearchPressed('myfavorite');
              },
            ),
            SizedBox(
              height: 20,
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? CustomFavoriteList()
                  : SearchItemsListFav(listItemsSearch: controller.searchDataFav),
            ),
          ],
        ),
      ),
    ));
  }
}


class SearchItemsListFav extends StatelessWidget {
  const SearchItemsListFav({super.key, required this.listItemsSearch});
  final List<MyFavoriteModel> listItemsSearch;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listItemsSearch.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      height: 110,
                      width: 120,
                      imageUrl:
                          '${AppLink.itemsImages}/${listItemsSearch[index].itemsImage}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                      child: ListTile(
                    title: Text(listItemsSearch[index].itemsName!),
                    // subtitle: Text(listItemsSearch[index].itemsDesc!),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
