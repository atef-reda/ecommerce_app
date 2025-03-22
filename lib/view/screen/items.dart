import 'package:ecommerce_app/controller/itemscontroller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/items/customcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/items/customitemslist.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImpl());
    return Scaffold(
      body: GetBuilder<ItemsControllerImpl>(
        builder: (controller) =>  Container(
            margin: EdgeInsets.all(15),
            child: ListView(
              children: [
                CustomAppar(hintText: '61'.tr,
                onPressedFavorite: (){
                  controller.goToFavorites();
                },
                // onPressedIcon: (){},
                onPressedSearch: (){},
                ),
                SizedBox(
                  height: 20,
                ),
                CustomCategoriesItemsList(),
                HandlingDataView(widget: CustomItemsList(),statusRequest: controller.statusRequest,),
              ],
            ),
          ),
        ),
    );
  }
}
