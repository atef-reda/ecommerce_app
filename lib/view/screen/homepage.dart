import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/home/customapparhome.dart';
import 'package:ecommerce_app/view/widget/home/customcardhome.dart';
import 'package:ecommerce_app/view/widget/home/customcategorieshome.dart';
import 'package:ecommerce_app/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/customitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ListView(
            children: [
              CustomApparHome(
                hintText: 'Find Product',
                onPressedIcon: () {},
                onPressedSearch: () {},
              ),
              CustomCardHome(
                title: 'A Summer Surprize',
                body: 'CashBack 20%',
              ),
              CustomTitleHome(title: 'Categories'),
              CustomCategoriesList(),
              CustomTitleHome(title: 'Product For You'),
              SizedBox(
                height: 10,
              ),
              CustomItemsList(),
              CustomTitleHome(title: 'Offer'),
              SizedBox(
                height: 10,
              ),
              CustomItemsList(),
            ],
          ),
        ),
      ),
    );
  }
}
