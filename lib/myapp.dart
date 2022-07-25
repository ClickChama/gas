import 'package:flutter/material.dart';
import 'package:gas/pages/BoasVindasPage.dart';
import 'package:gas/pages/HomePage.dart';
import 'package:gas/pages/loginPage.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  BoasVindasPage(),
    );
  }
}
