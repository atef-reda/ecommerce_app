import 'package:ecommerce_app/controller/myfavoritecontroller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            CustomAppar(hintText: 'Find Item'),
            SizedBox(
              height: 20,
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: CustomFavoriteList(),
            ),
          ],
        ),
      ),
    ));
  }
}
