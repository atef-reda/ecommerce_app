import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home Page',style: TextStyle(color: AppColor.primaryColor),),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}