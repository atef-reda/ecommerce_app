import 'package:ecommerce_app/core/constant/applinks.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomItemsCartList extends StatelessWidget {
  const CustomItemsCartList({
    super.key,
    required this.count,
    required this.price,
    required this.name,
    required this.image, required this.onAdd, required this.onRemove,
  });
  final int count;
  final double price;
  final String name;
  final String image;
  final void Function() onAdd;
  final void Function() onRemove;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 115,
              child: CachedNetworkImage(
                height: 110,
                width: 130,
                imageUrl: '${AppLink.itemsImages}/$image',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(fontSize: 15),
              ),
              subtitle: Text(
                'Price: $price \$',
                style: TextStyle(fontFamily: 'sans',color: AppColor.thirdColor,
                  fontSize: 10),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.add,
                    ),
                    onPressed: onAdd),
                Text(
                  '$count',
                  style: TextStyle(fontFamily: 'sans', fontSize: 15),
                ),
                IconButton(icon: Icon(Icons.remove), onPressed:onRemove),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
