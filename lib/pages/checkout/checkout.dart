import 'package:flutter/material.dart';
import 'package:gas/pages/userPage/adress.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool credito = false;
  bool debito = false;
  bool dinheiro = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
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
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
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
              CheckboxListTile(
                title: const Text(
                  'Cartão de Crédito Maquininha',
                  style: TextStyle(color: Colors.grey),
                ),
                value: credito,
                onChanged: (value) {
                  setState(() {
                    credito = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text(
                  'Cartão de débito Maquininha',
                  style: TextStyle(color: Colors.grey),
                ),
                value: debito,
                onChanged: (value) {
                  setState(() {
                    debito = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text(
                  'Dinheiro',
                  style: TextStyle(color: Colors.grey),
                ),
                value: dinheiro,
                onChanged: (value) {
                  setState(() {
                    dinheiro = value!;
                  });
                },
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
                              const Text(
                                'Rua',
                                style: TextStyle(
                                  color: Color(0xff999ea1),
                                  fontSize: 15,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                'Bairro',
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
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.red,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
