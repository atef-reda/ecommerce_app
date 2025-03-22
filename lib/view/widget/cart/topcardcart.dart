import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  const TopCardCart({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              // padding: const EdgeInsets.only(bottom: 5),
              child: Text(message, textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.backgroundcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            );
  }
}