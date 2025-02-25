import 'dart:io';

import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() {
  Get.defaultDialog(
    title: '51'.tr,
    middleText: '52'.tr,
    actions: [
      MaterialButton(
        color: AppColor.primaryColor,
        onPressed: () {
          Get.back();
        },
        child: Text(
          '53'.tr,
          style: TextStyle(
            color: AppColor.backgroundcolor,
          ),
        ),
      ),
      MaterialButton(
        color: AppColor.primaryColor,
        onPressed: () {
          exit(0);
        },
        child: Text(
          '54'.tr,
          style: TextStyle(
            color: AppColor.backgroundcolor,
          ),
        ),
      ),
    ],
  );
  return true;
}
