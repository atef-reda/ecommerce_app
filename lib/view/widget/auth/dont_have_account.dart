import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.color,required this.onTap});
  final String firstText;
  final String secondText;
  final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            secondText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: color,
                ),
          ),
        ),
      ],
    );
  }
}
