import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      onPressed:onPressed ,
      color: AppColor.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 70),
      
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
