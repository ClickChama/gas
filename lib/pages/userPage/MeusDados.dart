import 'package:flutter/material.dart';
import 'package:gas/configs/urlconfigs.dart';
import 'package:gas/pages/loginPage.dart';
import 'package:gas/pages/userPage/adress.dart';
import 'package:gas/providers/provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MeusDadosPage extends StatefulWidget {
  const MeusDadosPage({Key? key}) : super(key: key);

  @override
  State<MeusDadosPage> createState() => _MeusDadosPageState();
}

class _MeusDadosPageState extends State<MeusDadosPage> {
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? endereco;
  String? numero;
  String? complemento;
  String? bairro;
  String? cep;
  String? cidade;

  @override
  void initState() {
    getData();
    getAddress();
  }

  Future<bool> getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    _setHeaders() => {
          HttpHeaders.authorizationHeader: '${token}',
        };
    var fullUrl = Uri.parse('$BASE_API/auth/customer/info');
    var user = await http.get(fullUrl, headers: _setHeaders());
    String responseBody = user.body;
    if (user.statusCode == 200) {
      // print(jsonDecode(responseBody));
      setState(() {
        name = jsonDecode(responseBody)['name'];
        email = jsonDecode(responseBody)['email'];
        phone = jsonDecode(responseBody)['phone'];
      });

      return true;
    } else {
      // print(jsonDecode(responseBody));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginPage()));
      return false;
    }
  }

  Future<bool> getAddress() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var id = localStorage.getString('id_user');
    _setHeaders() => {
          HttpHeaders.authorizationHeader: '${token}',
        };
    var fullUrl = Uri.parse('$BASE_API/adress/get/$id');
    var address = await http.get(fullUrl, headers: _setHeaders());
    String responseBody = address.body;
    if (address.statusCode == 200) {
      print(responseBody);
      setState(() {
        endereco = jsonDecode(responseBody)['address'];
        numero = jsonDecode(responseBody)['number'];
        bairro = jsonDecode(responseBody)['district'];
        complemento = jsonDecode(responseBody)['complement'];
        cep = jsonDecode(responseBody)['zip_code'];
        cidade = jsonDecode(responseBody)['city'];
      });
      return true;
    } else {
      print(jsonDecode(responseBody));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 86,
          color: const Color(0xff4e0189),
          child: const Center(
            child: Text(
              "Meus Dados",
              style: TextStyle(
                color: Colors.white,
                fontSize: 21.81,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          width: 331,
          height: 126,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.44),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                color: Color(0x14000000),
                blurRadius: 15.74,
                offset: Offset(0, 0),
              ),
            ],
            color: Colors.white,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Dados Básicos",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Color(0xff4e0189),
                    fontSize: 12.22,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        name ?? 'Aguardando...',
                        style: const TextStyle(
                          color: Color(0xff999ea1),
                          fontSize: 15,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "CPF: ${cpf ?? ''}",
                        style: const TextStyle(
                          color: Color(0xff999ea1),
                          fontSize: 15,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Celular: ${phone ?? ''}",
                        style: const TextStyle(
                          color: Color(0xff999ea1),
                          fontSize: 15,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "E-mail: ${email}",
                        style: const TextStyle(
                          color: Color(0xff999ea1),
                          fontSize: 15,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/img/edit.png'),
                )
              ],
            )
          ]),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdressPage(),
                ));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            width: 331,
            height: 102,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.44),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 15.74,
                  offset: Offset(0, 0),
                ),
              ],
              color: Colors.white,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Endereço",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Color(0xff4e0189),
                      fontSize: 12.22,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          '${endereco ?? ''} ${numero ?? ''} ${complemento ?? ''}',
                          style: const TextStyle(
                            color: const Color(0xff999ea1),
                            fontSize: 15,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        Text(
                          '${bairro ?? ''} ${cidade ?? ''} ${cep ?? ''}',
                          style: const TextStyle(
                            color: const Color(0xff999ea1),
                            fontSize: 15,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/img/edit.png'),
                  )
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
