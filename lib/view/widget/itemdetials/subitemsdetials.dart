import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/itemdetialscontroller.dart';

class SubItemsDetials extends GetView<ItemDetialsControllerImpl> {
  const SubItemsDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: TextStyle(
              fontSize: 15, color: const Color.fromARGB(255, 30, 59, 105)),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              controller.subitems.length,
              (index) => Container(
                alignment: Alignment.center,
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  color:controller.subitems[index]['active']=='1'? AppColor.fourthColor:AppColor.backgroundcolor ,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  controller.subitems[index]['name'],
                  style: TextStyle(color: controller.subitems[index]['active']=='0'? AppColor.fourthColor:AppColor.backgroundcolor),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
