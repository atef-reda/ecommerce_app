import 'package:flutter/material.dart';

class CustomFormAuth extends StatelessWidget {
  const CustomFormAuth(
      {super.key,this.obscureText, required this.label, required this.hint, required this.icon, required this.controller, required this.validator, this.onPressedIcon});
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool? obscureText;
  final void Function()? onPressedIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText:obscureText==null||obscureText==false?false:true ,
        decoration: InputDecoration(
          
          suffixIcon: IconButton(icon: Icon(icon),onPressed:onPressedIcon ,),
          label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(label),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.labelMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
