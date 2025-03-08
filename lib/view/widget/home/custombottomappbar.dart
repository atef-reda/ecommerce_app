import 'package:ecommerce_app/controller/homescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custombuttonappbar.dart';

class CustomBottomAppbar extends GetView<HomescreencontrollerImpl> {
  const CustomBottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
          color: Color.fromARGB(255, 201, 201, 201),
          elevation: 2.0,
          // height: 70,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: ListView(
            scrollDirection: Axis.horizontal,
            // mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                controller.pages.length,
                (index) => CustomButtonAppBar(
                    active: controller.currentPage == index ? true : false,
                    iconData: Icons.home,
                    iconText: controller.appbarText[index],
                    onPressed: () {
                      controller.onPageChange(index);
                    }),
              ),
            ],
          ),
        );
  }
}