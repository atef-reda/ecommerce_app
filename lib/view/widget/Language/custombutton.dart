import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const Custombutton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.primaryColor,
      textColor: Colors.white,
      minWidth: 200,
      child: Text(text),
    );
  }
}
