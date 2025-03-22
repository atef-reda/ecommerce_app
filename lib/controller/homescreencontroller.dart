import 'package:ecommerce_app/view/screen/homepage.dart';
import 'package:ecommerce_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  onPageChange(int index);
}

class HomescreencontrollerImpl extends HomeScreenController {
  List<Widget> pages = [
    HomePage(),
    SettingsScreen(),
    Center(
      child: Text('Profile'),
    ),
    Center(
      child: Text('home'),
    ),
  ];
  List bottomAppbar = 
  [
    {'title':'Home','icon':Icons.home},
    {'title':'Settings','icon':Icons.settings},
    {'title':'Profile','icon':Icons.person},
    {'title':'notifaction','icon':Icons.notifications},
  ];
  int currentPage = 0;

  @override
  onPageChange(int index) {
    currentPage = index;
    update();
  }
}
