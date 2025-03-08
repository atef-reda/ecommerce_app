import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/data/model/catogriesmodel.dart';
import 'package:flutter/widgets.dart';
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

class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key, required this.catogriesModel});
  final CatogriesModel catogriesModel;
  @override
  Widget build(BuildContext context) {
    return Column(
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
            '${AppLink.categories}/${catogriesModel.categoriesImage}',
            colorFilter:
                const ColorFilter.mode(AppColor.thirdColor, BlendMode.srcIn),
          ),
        ),
        SizedBox(height: 5), // Add spacing to avoid overlap
        Text(
          "${catogriesModel.categoriesName}",
        ),
      ],
    );
  }
}
