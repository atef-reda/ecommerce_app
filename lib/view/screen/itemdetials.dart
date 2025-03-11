import 'package:ecommerce_app/controller/itemdetialscontroller.dart';
import 'package:ecommerce_app/core/constant/applinks.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../widget/itemdetials/itemsdetialsnavigationbar.dart';
import '../widget/itemdetials/priceandcount.dart';
import '../widget/itemdetials/subitemsdetials.dart';
import '../widget/itemdetials/topitemsdetialspage.dart';

class ItemDetials extends StatelessWidget {
  const ItemDetials({super.key});
  @override
  Widget build(BuildContext context) {
    ItemDetialsControllerImpl controller = Get.put(ItemDetialsControllerImpl());

    return Scaffold(
      bottomNavigationBar: ItemsDetialsNavigationBar(),
      body: ListView(
        children: [
         TopItemPageDetials(),
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.itemsModel.itemsName!,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.fourthColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PriceAndItemCount(
                    count: controller.itemsModel.itemsCount.toString(),
                    price: controller.itemsModel.itemsPrice.toString(),
                    onAdd: () {},
                    onRemove: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.itemsModel.itemsDesc! +
                        controller.itemsModel.itemsDesc! +
                        controller.itemsModel.itemsDesc! +
                        controller.itemsModel.itemsDesc!,
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColor.fourthColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rating:',
                        style: TextStyle(
                            fontSize: 15,
                            height: 1,
                            color: const Color.fromARGB(255, 30, 59, 105)),
                      ),
                      Container(
                        height: 15,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                size: 13,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SubItemsDetials(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
