import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/constant/applinks.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translationdatabase.dart';

class CustomItemsListHome extends GetView<HomeControllerImpl> {
  const CustomItemsListHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) => CustomItems(
                itemsModel: ItemsModel.fromJson(controller.items[index]),
              )),
    );
  }
}

class CustomItems extends StatelessWidget {
  const CustomItems({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 130,
          width: 150,
          alignment: Alignment.center,
          child: Image.network(
              height: 120,
              width: 140,
              '${AppLink.itemsImages}/${itemsModel.itemsImage}'),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 140,
          width: 180,
          decoration: BoxDecoration(
              color: AppColor.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
          left: 20,
          child: Text(
            '${traslationDataBase(arColumn: itemsModel.itemsNameAr!, enColumn: itemsModel.itemsName!)}', 
            style: TextStyle(
              fontSize: 13,
              color: AppColor.backgroundcolor,
            ),
          ),
        ),
      ],
    );
  }
}
