import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/itemdetialscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/applinks.dart';
import '../../../core/constant/color.dart';

class TopItemPageDetials extends GetView<ItemDetialsControllerImpl> {
  const TopItemPageDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: AppColor.grey,
                ),
              ),
              Positioned(
                top: 60,
                right: Get.width / 8,
                left: Get.width / 8,
                child: Hero(
                  tag: controller.itemsModel.itemsId!,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${AppLink.itemsImages}/${controller.itemsModel.itemsImage!}',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          );
  }
}