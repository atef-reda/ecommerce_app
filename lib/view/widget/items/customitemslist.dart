import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/favoritecontroller.dart';
import 'package:ecommerce_app/controller/itemscontroller.dart';
import 'package:ecommerce_app/core/functions/translationdatabase.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/applinks.dart';
import '../../../core/constant/color.dart';

class CustomItemsList extends GetView<ItemsControllerImpl> {
  const CustomItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          itemCount: controller.items.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.5),
          itemBuilder: (context, index) {
            return CustomItem(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
            );
          },
        ),
      ],
    );
  }
}

class CustomItem extends GetView<ItemsControllerImpl> {
  const CustomItem({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    FavoriteControllerImpl favoriteController = Get.put(FavoriteControllerImpl());
    favoriteController.isFavorite[itemsModel.itemsId.toString()] =itemsModel.favorite!;
    return InkWell(
      onTap: () {
        controller.goToItemDetials(itemsModel);
      },
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: itemsModel.itemsId!,
                child: CachedNetworkImage(
                  height: 150,
                  fit: BoxFit.fill,
                  imageUrl: "${AppLink.itemsImages}/${itemsModel.itemsImage}",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${traslationDataBase(arColumn: itemsModel.itemsNameAr!, enColumn: itemsModel.itemsName!)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('67'.tr, style: TextStyle(fontSize: 15)),
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
                                )),
                      ],
                    ),
                  )
                ],
              ),
              // SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${itemsModel.itemsPrice} \$',
                    style: TextStyle(
                        fontFamily: 'sans', color: AppColor.primaryColor),
                  ),
                  GetBuilder<FavoriteControllerImpl>(
                    builder: (context) {
                      return IconButton(
                          onPressed: () {
                            if(favoriteController.isFavorite[itemsModel.itemsId.toString()] == '1'){
                              favoriteController.setFavorite(itemsModel.itemsId.toString(), '0');
                            }else{
                              favoriteController.setFavorite(itemsModel.itemsId.toString(), '1');
                            }
                          },
                          icon: Icon(
                            favoriteController.isFavorite[itemsModel.itemsId.toString()] == '1'
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ));
                    }
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
