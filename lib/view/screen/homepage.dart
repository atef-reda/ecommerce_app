import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/home/customcardhome.dart';
import 'package:ecommerce_app/view/widget/home/customcategorieshome.dart';
import 'package:ecommerce_app/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/applinks.dart';
import '../widget/home/customitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            CustomAppar(
              mycontroller: controller.searchController!,
              onChangedForm: (val) {
                controller.onChangeForm(val);
              },
              hintText: '61'.tr,
              onPressedSearch: () {
                controller.onSearchPressed("items1view");
              },
              onPressedFavorite: () {
                controller.goToFavorite();
              },
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          CustomCardHome(
                            title: '62'.tr,
                            body: '63'.tr,
                          ),
                          CustomTitleHome(title: '64'.tr),
                          CustomCategoriesList(),
                          CustomTitleHome(title: '65'.tr),
                          SizedBox(
                            height: 10,
                          ),
                          CustomItemsListHome(),
                          CustomTitleHome(title: '66'.tr),
                          SizedBox(
                            height: 10,
                          ),
                          CustomItemsListHome(),
                        ])
                  : SearchItemsList(
                      listItemsSearch: controller.searchData,
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchItemsList extends GetView<HomeControllerImpl> {
  const SearchItemsList({super.key, required this.listItemsSearch});
  final List<ItemsModel> listItemsSearch;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listItemsSearch.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                controller.goToItemDetials(listItemsSearch[index]);
              },
              child: Card(
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
                            subtitle:
                                Text(listItemsSearch[index].categoriesName!),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
