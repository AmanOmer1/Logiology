import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/Pages/LoginPage.dart';
import 'package:logiology/Routes/AppPageRoutes.dart';
import 'package:logiology/Routes/PageRoutes.dart';

void main() {
  runApp(LogiologyApp());
}

class LogiologyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Logiology',
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPageRoutes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
