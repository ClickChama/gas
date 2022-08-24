import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gas/configs/urlconfigs.dart';
import 'package:gas/order/order_result/order_result.dart';
import 'package:gas/pages/models/order.dart';
import 'package:gas/pages/pedidos/pedidos.dart';
import 'package:gas/pages/userPage/adress.dart';
import 'package:gas/user/address/controller/address_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PedidoPage extends StatefulWidget {
  PedidoPage({Key? key}) : super(key: key);

  final List<OrderModel> orderIten = Get.arguments;

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int status = 0;
  @override
  void initState() {
    getOrderById();
    verifyOrder();
    super.initState();
  }

  verifyOrder() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      getOrderById();
    });
  }

  Future getOrderById() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var fullUrl = Uri.parse('$BASE_API/customer/order/${widget.orderIten.last.id}');
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
      return OrderResult<List<OrderModel>>.error('erro');
    } else {
      if (responseBody.isNotEmpty) {
        setState(() {
          status = jsonDecode(responseBody)['status'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(78, 1, 137, 1),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Text(
                      'Aguardando Confirmação Revenda',
                      textAlign: TextAlign.center,
                      style: (status == 0) ? const TextStyle(color: Color.fromARGB(255, 212, 1, 1), fontFamily: 'Inter', fontSize: 10.46369743347168, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1) : const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Inter', fontSize: 10.46369743347168, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Text(
                      'Pedido confirmado em preparação',
                      textAlign: TextAlign.center,
                      style: (status == 1) ? const TextStyle(color: Color.fromARGB(255, 212, 1, 1), fontFamily: 'Inter', fontSize: 10.46369743347168, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1) : const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Inter', fontSize: 10.46369743347168, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Text(
                      'Saiu para entrega',
                      textAlign: TextAlign.center,
                      style: (status == 2) ? const TextStyle(color: Color.fromARGB(255, 212, 1, 1), fontFamily: 'Inter', fontSize: 10.46369743347168, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1) : const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Inter', fontSize: 10.46369743347168, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Text(
                      'Produdo entregue',
                      textAlign: TextAlign.center,
                      style: (status == 3) ? const TextStyle(color: Color.fromARGB(255, 212, 1, 1), fontFamily: 'Inter', fontSize: 10.46369743347168, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1) : const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Inter', fontSize: 10.46369743347168, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            width: double.infinity,
            height: 102,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.44),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 15.74,
                  offset: Offset(0, 0),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Recebemos seu Pedido",
                  style: TextStyle(
                    color: Color(0xff4e0189),
                    fontSize: 12.22,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "A Revenda pode levar até 5 minutos para\nconfirmar o pedido",
                  style: TextStyle(
                    color: Color(0xff999ea1),
                    fontSize: 15,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: double.infinity,
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
                          GetBuilder<AddressController>(
                            builder: (address) {
                              return Text(
                                '${address.addressName()}, ${address.addressNumber()} - ${address.addressComplement()}',
                                style: const TextStyle(
                                  color: Color(0xff999ea1),
                                  fontSize: 15,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            },
                          ),
                          // ignore: prefer_const_constructors
                          GetBuilder<AddressController>(
                            builder: (address) {
                              return Text(
                                '${address.addressDistric()} - ${address.addressCity()}',
                                style: const TextStyle(
                                  color: Color(0xff999ea1),
                                  fontSize: 15,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            },
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
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Resumo do pedido",
                  style: TextStyle(
                    color: Color(0xff4e0189),
                    fontSize: 12.22,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff3c0269),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Pedido #551",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.91,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/img/chama.png'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.75),
                        color: const Color(0xffff614c),
                      ),
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.orderIten.last.seller!.name}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Revenda ${widget.orderIten.last.seller!.name}",
                      style: const TextStyle(
                        color: Color(0xff999ea1),
                        fontSize: 15,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const Text(
                  "5,0",
                  style: TextStyle(
                    color: Color(0xff4e0189),
                    fontSize: 12.22,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  flex: 6,
                  child: Text(
                    "Produtos",
                    style: TextStyle(
                      color: Color(0xff4e0189),
                      fontSize: 12.22,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Quant",
                    style: TextStyle(
                      color: Color(0xff4e0189),
                      fontSize: 12.22,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Total",
                    style: TextStyle(
                      color: Color(0xff4e0189),
                      fontSize: 12.22,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            itemCount: widget.orderIten.last.orderProducts?.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 6,
                        child: (widget.orderIten[0].orderProducts![index].name == '1')
                            ? const Text(
                                'Botijão De Gás 13kg',
                                style: TextStyle(
                                  color: Color(0xff999ea1),
                                  fontSize: 15,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : const Text(
                                'Aguá Mineral 20 lts',
                                style: TextStyle(
                                  color: Color(0xff999ea1),
                                  fontSize: 15,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${widget.orderIten[0].orderProducts![index].quantity}',
                          style: const TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 15,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "R\$ ${widget.orderIten[0].orderProducts![index].unitPrice}",
                          style: const TextStyle(
                            color: Color(0xff4e0189),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 200,
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Pagamento",
                          style: TextStyle(
                            color: Color(0xff4e0189),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Débito na entrega",
                          style: TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Cupom",
                          style: TextStyle(
                            color: Color(0xff4e0189),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "R\$ 0,00",
                          style: TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Taxa de entrega",
                          style: TextStyle(
                            color: Color(0xff4e0189),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Grátis",
                          style: TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        flex: 6,
                        child: Text(
                          "Total a pagar",
                          style: TextStyle(
                            color: Color(0xff4e0189),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "R\$ ${widget.orderIten.last.totalPrice}",
                          style: const TextStyle(
                            color: Color(0xff999ea1),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 5,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            width: 194,
                            height: 46,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 194,
                                  height: 46,
                                  color: const Color(0xffe24329),
                                  padding: const EdgeInsets.only(
                                    left: 31,
                                    right: 39,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Cancelar Pedido",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TodosPedidosPage()));
                          },
                          child: Expanded(
                            flex: 5,
                            child: SizedBox(
                              width: 194,
                              height: 46,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 194,
                                    height: 46,
                                    color: const Color(0xff4e0189),
                                    padding: const EdgeInsets.only(
                                      left: 26,
                                      right: 31,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Ver todos pedidos",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
