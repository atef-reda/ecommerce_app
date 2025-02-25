import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CustomOtpFiledText extends StatelessWidget {
  const CustomOtpFiledText({super.key, required this.onSubmit});
  final void Function(String) onSubmit;
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 5,
      fieldWidth: 45.0,
      borderRadius: BorderRadius.circular(12),
      borderColor: Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit:onSubmit, // end onSubmit
    );
  }
}
