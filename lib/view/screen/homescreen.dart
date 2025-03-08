import 'package:ecommerce_app/controller/homescreencontroller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/custombottomappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreencontrollerImpl());
    return GetBuilder<HomescreencontrollerImpl>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {},
          child: Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppbar(),
        body: controller.pages.elementAt(controller.currentPage),
      );
    });
  }
}
