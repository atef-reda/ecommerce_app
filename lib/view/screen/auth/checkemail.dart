import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/checkemailcontroller.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombutton.dart';
import '../../widget/auth/customform.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImpl controller =
        Get.put(CheckEmailControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text('27'.tr),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: AppColor.grey),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            CustomTextTitleAuth(title: '38'.tr),
            CustomTextBodyAuth(body: '29'.tr),
            const SizedBox(height: 30),
            CustomFormAuth(
              validator: (val) {
                return validInput(val!, 20, 100,'email');
              },
              controller: controller.emailController,
              label: '18'.tr,
              hint: '12'.tr,
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 30),
            CustomButtonAuth(
                text: '30'.tr,
                onPressed: () {
                  controller.goToVerifyCodeSignUp();
                }),
          ],
        ),
      ),
    );
  }
}
