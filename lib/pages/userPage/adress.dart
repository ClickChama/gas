// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas/pages/userPage/MeusDados.dart';
import 'package:gas/user/address/controller/address_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:brasil_fields/brasil_fields.dart';

class AdressPage extends StatefulWidget {
  const AdressPage({Key? key}) : super(key: key);

  @override
  State<AdressPage> createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  String resultado = 'Aqui';
  var id;

  final addressController = Get.find<AddressController>();

  TextEditingController txtcep = TextEditingController();
  var txtendereco = TextEditingController();
  var txtbairro = TextEditingController();
  var txtuf = TextEditingController();
  var txtcidade = TextEditingController();
  var txtnumber = TextEditingController();
  var txtcomplemento = TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<bool> getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    _setHeaders() => {
          HttpHeaders.authorizationHeader: '$token',
        };
    var fullUrl = Uri.parse('https://click-chama-api.simetriastudio.dev.br/api/auth/customer/info');
    var user = await http.get(fullUrl, headers: _setHeaders());
    String responseBody = user.body;
    if (user.statusCode == 200) {
      // print(jsonDecode(responseBody));
      setState(() {
        id = jsonDecode(responseBody)['id'];
      });
      return true;
    } else {
      return false;
    }
  }

  void buscacep() async {
    String cep = txtcep.text;
    var url = Uri.parse('https://viacep.com.br/ws/$cep/json/');

    http.Response response;

    response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> dados = json.decode(response.body);

      String logradouro = dados['logradouro'] ?? '';
      String complemento = dados['complemento'] ?? '';
      String bairro = dados['bairro'] ?? '';
      String cidade = dados['localidade'] ?? '';
      String uf = dados['uf'] ?? '';

      setState(() {
        txtendereco.text = logradouro;
        txtbairro.text = bairro;
        txtuf.text = uf;
        txtcidade.text = cidade;
      });
    } else {
      print('cep não encontrado!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 86,
          color: const Color(0xff4e0189),
          child: const Center(
            child: Text(
              "Meu Endereço",
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      // obrigatório
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(ponto: false),
                    ],
                    controller: txtcep,
                    onChanged: (value) => {
                      print(value),
                      buscacep(),
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CEP',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: TextFormField(
                    controller: txtendereco,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Endereço',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        child: TextFormField(
                          controller: txtnumber,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Numero',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        child: TextFormField(
                          controller: txtcomplemento,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Complemento',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: TextFormField(
                    controller: txtbairro,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Bairro',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        child: TextFormField(
                          controller: txtuf,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Estado',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        child: TextFormField(
                          controller: txtcidade,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cidade',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            addressController.storeAddress(
                              txtendereco.text,
                              txtnumber.text,
                              txtcomplemento.text,
                              txtbairro.text,
                              txtcidade.text,
                              txtuf.text,
                              txtcep.text,
                            );
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MeusDadosPage()));
                          },
                          child: const Text('Salvar'),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
