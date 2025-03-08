import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  const CustomButtonAppBar(
      {super.key,
      required this.iconData,
      required this.iconText,
      required this.onPressed,
      required this.active});
  final IconData iconData;
  final String iconText;
  final bool active;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active ? AppColor.primaryColor : AppColor.black,
          ),
          Text(
            iconText,
            style: TextStyle(
                color: active ? AppColor.primaryColor : AppColor.black),
          )
        ],
      ),
    );
  }
}
