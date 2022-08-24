// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gas/pages/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool value = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                            style: GoogleFonts.inter(textStyle: const TextStyle(color: Colors.black, fontSize: 21.81, fontWeight: FontWeight.w600)),
                          ),
                          const Text(
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
              Container(
                margin: const EdgeInsets.only(top: 30.0, left: 12.0, right: 12.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameController,
                        validator: (nome) {
                          if (nome == null || nome.isEmpty) {
                            return 'Por favor, digite seu nome completo!';
                          } else if (nome.length < 5) {
                            return 'Por favor, nome maior que 5 caracteres';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Nome completo',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Por favor, digite seu e-mail';
                          } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text)) {
                            return 'Por favor, digite um e-mail correto';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Digite sue e-mail',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _phoneController,
                        validator: (nome) {
                          if (nome == null || nome.isEmpty) {
                            return 'Por favor, digite seu celular!';
                          } else if (nome.length < 8) {
                            return 'Por favor, celular maior que 8 caracteres';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Celular com DDD',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Por favor, digite sua senha!';
                          } else if (senha.length < 5) {
                            return 'Por favor, senha maior que 5 caracteres';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Crie sua senha',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Por favor, digite sua senha!';
                          }
                          if (senha != _passwordController.text) {
                            return 'As senhas não são iguais';
                          } else if (senha.length < 5) {
                            return 'Por favor, senha maior que 5 caracteres';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirmar senha',
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: value,
                        onChanged: (value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                      const Text(
                        'Ao marcar você aceita os Termos de Uso',
                        style: TextStyle(
                          color: Color(0xff000c14),
                          fontSize: 12.22,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
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
                            backgroundColor: const Color(0xffe24329),
                          ),
                          onPressed: () async {
                            FocusScopeNode curretFocus = FocusScope.of(context);
                            if (_formKey.currentState!.validate()) {
                              var deuCerto = await register();
                              if (!curretFocus.hasPrimaryFocus) {
                                curretFocus.unfocus();
                              }
                              if (deuCerto) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginPage()));
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                              } else {
                                _passwordController.clear();
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            }
                          },
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    Expanded(flex: 4, child: Container()),
                    const Expanded(
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
                margin: const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0, bottom: 40.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xff4e0189),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  final snackBar = const SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(
        'Dados inválidos',
        textAlign: TextAlign.center,
      ));

  final snackBar2 = const SnackBar(
      backgroundColor: Colors.greenAccent,
      content: Text(
        'Registrado com sucesso!',
        textAlign: TextAlign.center,
      ));

  Future<bool> register() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String credentials = "${_emailController.text}:${_passwordController.text}";
    var encodeHead = base64.encode(utf8.encode(credentials));
    _setHeaders() => {
          HttpHeaders.authorizationHeader: 'Basic $encodeHead',
        };

    var url = Uri.parse('https://click-chama-api.simetriastudio.dev.br/api/auth/customer/register');

    var resposta = await http.post(
      url,
      headers: _setHeaders(),
      body: {'name': _nameController.text, 'email': _emailController.text, 'password': _passwordController.text, 'phone': _phoneController.text},
    );
    String responseBody = resposta.body;
    // dynamic jsonObject = jsonDecode(jsonDecode(resposta.body));
    if (resposta.statusCode == 200) {
      print(jsonDecode(responseBody));
      await sharedPreferences.setString('token', 'Bearer ${jsonDecode(responseBody)['access_token']}');
      return true;
    } else {
      print(jsonDecode(responseBody));
      return false;
    }
  }
}
