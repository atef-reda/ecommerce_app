import 'package:ecommerce_app/bindings.dart';
import 'package:ecommerce_app/core/localization/changelocal.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/translation.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyServices().intialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ChangeLocalController changeLocalController =
        Get.put(ChangeLocalController());
    return GetMaterialApp(
      initialBinding: MyBiniding(),
      locale: changeLocalController.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: changeLocalController.appTheme,
      // home: CartScreen(),
      getPages: getPages,
    );
  }
}
