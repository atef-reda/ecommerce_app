import 'package:ecommerce_app/view/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  onPageChange(int index);
}

class HomescreencontrollerImpl extends HomeScreenController {
  List<Widget> pages = [
    HomePage(),
    Center(
      child: Text('Settings'),
    ),
    Center(
      child: Text('Profile'),
    ),
    Center(
      child: Text('home'),
    ),
  ];
  List<String> appbarText = ['home','settings','profile','favorite'];
  int currentPage = 0;

  @override
  onPageChange(int index) {
    currentPage = index;
    update();
  }
}
