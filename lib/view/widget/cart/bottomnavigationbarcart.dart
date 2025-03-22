import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'cusstombuttoncart.dart';

class BottomNavigationBarCart extends StatelessWidget {
  const BottomNavigationBarCart({super.key, required this.price, required this.shipping, required this.totalPrice});
  final String price;
  final String shipping;
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'price: ',
                  style: TextStyle(fontSize: 16),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '$price \$',
                  style: TextStyle(fontFamily: 'sans'),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'shipping: ',
                  style: TextStyle(fontSize: 16),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('$shipping \$', style: TextStyle(fontFamily: 'sans'))),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'total price: ',
                  style: TextStyle(fontSize: 16, color: AppColor.secondColor),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('$totalPrice \$',
                    style: TextStyle(
                        fontFamily: 'sans', color: AppColor.secondColor))),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        CustombuttonCart(
          text: 'Check Out',
          onPressed: () {},
        ),
      ],
    );
  }
}
