import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustombuttonCart extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustombuttonCart({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        // minWidth: 500,
        child: Text(text),
      ),
    );
  }
}
