import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/functions/translationdatabase.dart';
import 'package:ecommerce_app/data/model/catogriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/applinks.dart';
import '../../../core/constant/color.dart';

class CustomCategoriesList extends GetView<HomeControllerImpl> {
  const CustomCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 120, // Ensure a fixed height
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCategories(
            catSelected: index,
            catogriesModel:
                CatogriesModel.fromJson(controller.categories[index]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
      ),
    );
  }
}

class CustomCategories extends GetView<HomeControllerImpl> {
  const CustomCategories(
      {super.key, required this.catogriesModel, required this.catSelected});
  final CatogriesModel catogriesModel;
  final int catSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(catSelected, controller.categories,catogriesModel.categoriesId.toString());
      },
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevents unnecessary space
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              '${AppLink.categoriesImages}/${catogriesModel.categoriesImage}',
              colorFilter:
                  const ColorFilter.mode(AppColor.thirdColor, BlendMode.srcIn),
            ),
          ),
          SizedBox(height: 5), // Add spacing to avoid overlap
          Text(
            "${traslationDataBase(arColumn: catogriesModel.categoriesNameAr!, enColumn: catogriesModel.categoriesName!)}",
          ),
        ],
      ),
    );
  }
}
