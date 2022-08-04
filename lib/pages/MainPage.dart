// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gas/pages/homePage/ListViewWi.dart';
import 'package:gas/pages/userPage/perfil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gas/pages/loginPage.dart';
import 'dart:convert';
import 'dart:io';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var name;
  int _selectedIndex = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<bool> getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    _setHeaders() => {
          HttpHeaders.authorizationHeader: '${token}',
        };
    var fullUrl = Uri.parse('https://click-chama-api.simetriastudio.dev.br/api/auth/customer/info');
    var user = await http.get(fullUrl, headers: _setHeaders());
    String responseBody = user.body;
    if (user.statusCode == 200) {
      // print(jsonDecode(responseBody));

      setState(() {
        name = jsonDecode(responseBody)['name'];
        localStorage.setString('id_user', jsonDecode(responseBody)['id']);
      });
      return true;
    } else {
      // print(jsonDecode(responseBody));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginPage()));
      return false;
    }
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilPage()));
        break;
    }
    setState(() {
      _selectedIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(children: [
            SizedBox(
              width: double.infinity,
              height: 160,
              child: Container(
                color: const Color(0xff4e0189),
                child: SizedBox(
                  width: double.infinity,
                  height: 147,
                  child: Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                          child: Text(
                            'Olá, ${name}! 👋',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                          // ignore: prefer_const_constructors
                          child: Text(
                            'R. Salvador Ferrante, 2470 - 25a  Boqueirão 81670-390',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11.32,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 130.0),
                width: double.infinity,
                height: 80,
                // ignore: sort_child_properties_last
                child: const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Busque revenda por nome',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 35,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 5.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: Column(children: [
                        Image.asset('assets/img/estrela.png'),
                        const Text(
                          'Avaliação',
                          style: TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: Column(children: [
                        Image.asset('assets/img/clock.png'),
                        const Text(
                          'Tempo',
                          style: TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: Column(children: [
                        Image.asset('assets/img/money.png'),
                        const Text(
                          'Preço',
                          style: TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: Column(children: [
                        Image.asset('assets/img/pin.png'),
                        const Text(
                          'Distância',
                          style: TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListProduct(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xff4e0189),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout),
              label: 'Pedidos',
              backgroundColor: Color(0xff4e0189),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Alertas',
              backgroundColor: Color(0xff4e0189),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
              backgroundColor: Color(0xff4e0189),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onTap,
        ),
      ),
    );
  }
}
