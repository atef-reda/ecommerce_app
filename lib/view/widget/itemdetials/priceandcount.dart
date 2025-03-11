import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class PriceAndItemCount extends StatelessWidget {
  const PriceAndItemCount({
    super.key,
    required this.count,
    required this.price, required this.onAdd, required this.onRemove,
  });
  final String count;
  final String price;
  final void Function() onAdd;
  final void Function() onRemove;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onAdd,
              icon: Icon(Icons.add),
            ),
            Container(
              width: 40,
              padding: EdgeInsets.only(bottom: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                count,
                style: TextStyle(
                    height: 1.1,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 30, 59, 105)),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: Icon(Icons.remove),
            ),
          ],
        ),
        Spacer(),
        Text(
          'Price: $price \$',
          style: TextStyle(fontSize: 15, color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
