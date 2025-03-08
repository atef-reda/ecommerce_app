import 'package:flutter/widgets.dart';

import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  const CustomTitleHome({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: AppColor.secondColor,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }
}
