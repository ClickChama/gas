import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gas/configs/urlconfigs.dart';
import 'package:gas/pages/MainPage.dart';
import 'package:gas/pages/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BoasVindasPage extends StatefulWidget {
  const BoasVindasPage({Key? key}) : super(key: key);

  @override
  State<BoasVindasPage> createState() => _BoasVindasPageState();
}

class _BoasVindasPageState extends State<BoasVindasPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificarToken().then((value) {
      if (value) {
     
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Future<bool> verificarToken() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if (sharedPreference.getString('token') == null) {
      return false;
    } else {
      return true;
    }
  }
}
