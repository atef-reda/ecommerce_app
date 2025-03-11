import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class ItemsDetialsNavigationBar extends StatelessWidget {
  const ItemsDetialsNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
  }
}