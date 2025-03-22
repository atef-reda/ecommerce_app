import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/myfavoritecontroller.dart';
import 'package:ecommerce_app/core/functions/translationdatabase.dart';
import 'package:ecommerce_app/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/applinks.dart';
import '../../../core/constant/color.dart';

class CustomFavoriteList extends GetView<MyFavoriteControllerImpl> {
  const CustomFavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          itemCount: controller.data.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.55),
          itemBuilder: (context, index) {
            return CustomItem(
              favoriteModel: controller.data[index], 
            );
          },
        ),
      ],
    );
  }
}

class CustomItem extends GetView<MyFavoriteControllerImpl> {
  const CustomItem({super.key, required this.favoriteModel});
  final MyFavoriteModel favoriteModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              height: 150,
              fit: BoxFit.fill,
              imageUrl: "${AppLink.itemsImages}/${favoriteModel.itemsImage}",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${traslationDataBase(arColumn: favoriteModel.itemsNameAr!, enColumn: favoriteModel.itemsName!)}',
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
                  '${favoriteModel.itemsPrice} \$',
                  style: TextStyle(
                      fontFamily: 'sans', color: AppColor.primaryColor),
                ),
               IconButton(onPressed: (){
                controller.deleteItemFromFavorite(favoriteModel.favoritesId.toString());
               }, icon: Icon(Icons.delete_forever,color: AppColor.primaryColor,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
