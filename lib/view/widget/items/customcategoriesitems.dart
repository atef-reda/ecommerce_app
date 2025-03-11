import 'package:ecommerce_app/controller/itemscontroller.dart';
import 'package:ecommerce_app/data/model/catogriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translationdatabase.dart';

class CustomCategoriesItemsList extends GetView<ItemsControllerImpl> {
  const CustomCategoriesItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 10),
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

class CustomCategories extends GetView<ItemsControllerImpl> {
  const CustomCategories(
      {super.key, required this.catogriesModel, required this.catSelected});
  final CatogriesModel catogriesModel;
  final int catSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.onCategoriesChange(catSelected,catogriesModel.categoriesId.toString());
        // controller.goToItems(catSelected, controller.categories);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevents unnecessary space
        children: [
          SizedBox(height: 5), // Add spacing to avoid overlap
          GetBuilder<ItemsControllerImpl>(builder: (context) {
            return Container(
              padding: EdgeInsets.only(bottom: 5, left: 5, right: 6),
              decoration: controller.selectedCat == catSelected
                  ? BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: const Color.fromARGB(255, 240, 49, 32),
                              width: 3)))
                  : null,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "${traslationDataBase(arColumn: catogriesModel.categoriesNameAr!, enColumn:catogriesModel.categoriesName!)}",
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            );
          }),
        ],
      ),
    );
  }
}
