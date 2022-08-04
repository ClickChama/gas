// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gas/pages/MainPage.dart';
import 'package:gas/pages/RegisterPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 110.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: double.infinity,
                height: 70.0,
                child: Row(children: [
                  Expanded(
                    flex: 5,
                    child: Image.asset("assets/img/logo.png"),
                  ),
                  Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Olá! 👋",
                            style: GoogleFonts.inter(textStyle: TextStyle(color: Colors.black, fontSize: 21.81, fontWeight: FontWeight.w600)),
                          ),
                          Text(
                            "Entre ou cadastre-se",
                            style: TextStyle(
                              color: Color(0xff999ea1),
                              fontSize: 12.22,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )),
                ]),
              ),

              //Form inputs
              Container(
                margin: const EdgeInsets.only(top: 50.0, left: 12.0, right: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Por favor, digite seu e-mail';
                            } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text)) {
                              return 'Por favor, digite um e-mail correto';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Digite sue e-mail',
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            validator: (senha) {
                              if (senha == null || senha.isEmpty) {
                                return 'Por favor, digite sua senha!';
                              } else if (senha.length < 5) {
                                return 'Por favor, senha maior que 5 caracteres';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Digite sua senha',
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            child: Text("Esqueceu senha",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Color(0xfffb344f),
                                    fontSize: 16.22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    )),
              ),

              Container(
                margin: const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff4e0189),
                      ),
                      onPressed: () async {
                        FocusScopeNode curretFocus = FocusScope.of(context);
                        if (_formKey.currentState!.validate()) {
                          var deuCerto = await login();
                          if (!curretFocus.hasPrimaryFocus) {
                            curretFocus.unfocus();
                          }
                          if (deuCerto) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                          } else {
                            _passwordController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    Expanded(flex: 4, child: Container()),
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Ou",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Expanded(flex: 4, child: Container()),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xffe24329),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                          },
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  final snackBar = SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(
        'E-mail ou senha inválidos',
        textAlign: TextAlign.center,
      ));

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String credentials = "${_emailController.text}:${_passwordController.text}";
    var encodeHead = base64.encode(utf8.encode(credentials));

    _setHeaders() => {
          HttpHeaders.authorizationHeader: 'Basic ' + encodeHead,
        };

    var url = Uri.parse('https://click-chama-api.simetriastudio.dev.br/api/auth/customer/login');
    var resposta = await http.post(
      url,
      headers: _setHeaders(),
      body: {'email': _emailController.text, 'password': _passwordController.text},
    );
    String responseBody = resposta.body;
    // dynamic jsonObject = jsonDecode(jsonDecode(resposta.body));
    if (resposta.statusCode == 200) {
      print(jsonDecode(responseBody)['id']);
      await sharedPreferences.setString('token', 'Bearer ${jsonDecode(responseBody)['access_token']}');

      return true;
    } else {
      print(jsonDecode(responseBody));
      return false;
    }
  }
}
