import 'package:finace_app/main_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: [
        GetPage(name: '/', page: () => MainScreen()),
        ...AppPages.routes,
      ],
    ),
  );
}
