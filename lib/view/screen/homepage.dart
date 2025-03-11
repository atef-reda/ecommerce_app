import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
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
              CustomAppar(
                hintText: '61'.tr,
                onPressedIcon: () {},
                onPressedSearch: () {},
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
