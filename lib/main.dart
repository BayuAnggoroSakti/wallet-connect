import 'package:flutter/material.dart';
import 'package:wallet_connect_bayu/app/controllers/page_index_controller.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(PageIndexController(), permanent: true);
  runApp(GetMaterialApp(
    title: "Application",
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    getPages: AppPages.routes,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'inter',
    ),
  ));
}
