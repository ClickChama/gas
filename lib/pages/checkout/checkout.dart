import 'package:flutter/material.dart';
import 'package:gas/order/controller/order_controller.dart';
import 'package:gas/pages/userPage/adress.dart';
import 'package:gas/user/address/controller/address_controller.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

enum SingingCharacter { credito, debito, dinheiro }

class _CheckoutPageState extends State<CheckoutPage> {
  final orderController = Get.find<OrderContrller>();

  bool display = false;
  var txttroco = TextEditingController();
  SingingCharacter? _character = SingingCharacter.credito;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 95,
            color: const Color(0xff4e0189),
            child: const Center(
              child: Text(
                "Forma de pagamento",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.81,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adicionar Cupom',
                    hintText: 'Insira o código',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                child: const Text(
                  "Pague na entrega",
                  style: TextStyle(
                    color: Color(0xff4e0189),
                    fontSize: 12.22,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Crédito'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.credito,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                      display = false;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Débito'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.debito,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                      display = false;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Dinheiro'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.dinheiro,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                      display = true;
                    });
                  },
                ),
              ),
              Visibility(
                visible: display,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: TextFormField(
                    controller: txttroco,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Troco para',
                    ),
                  ),
                ),
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
                  margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: const Color(0xffe24329),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Anterior",
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
              ),
              GestureDetector(
                onTap: () {
                  orderController.storeOrder(_character, txttroco.text);
                },
                child: Container(
                  color: const Color(0xff4e0189),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Realizar  pedido",
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
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
