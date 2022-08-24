import 'package:flutter/material.dart';
import 'package:gas/pages/BoasVindasPage.dart';
import 'package:gas/pages/HomePage.dart';
import 'package:gas/pages/homePage/ListProducts.dart';
import 'package:gas/pages/loginPage.dart';
import 'package:gas/pages_routes/app_pages.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const BoasVindasPage(),
      getPages: AppPages.pages,
    );
  }
}
