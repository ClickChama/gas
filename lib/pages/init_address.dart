import 'dart:convert';
import 'dart:io';
import 'package:gas/pages/MainPage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gas/configs/urlconfigs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitApp extends StatefulWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var fullUrl = Uri.parse('$BASE_API/auth/customer/info');
    var token = localStorage.getString('token');
    _setHeaders() => {
          HttpHeaders.authorizationHeader: '$token',
        };
    final response = await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
    String responseBody = response.body;
    final results = [jsonDecode(response.body)];
    if (response.statusCode != 200) {
      print('erro');
    } else {
      // print(responseBody);
      await localStorage.setString('id_user', '${jsonDecode(responseBody)['id']}');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
