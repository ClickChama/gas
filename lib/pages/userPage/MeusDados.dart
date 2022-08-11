import 'package:flutter/material.dart';
import 'package:gas/pages/userPage/adress.dart';
import 'package:gas/user/address/controller/address_controller.dart';
import 'package:gas/user/info/controller/user_controller.dart';
import 'package:get/get.dart';

class MeusDadosPage extends StatefulWidget {
  const MeusDadosPage({Key? key}) : super(key: key);

  @override
  State<MeusDadosPage> createState() => _MeusDadosPageState();
}

class _MeusDadosPageState extends State<MeusDadosPage> {
  @override
  void initState() {}

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
                      GetBuilder<UserController>(
                        builder: (user) {
                          return Text(
                            user.userName(),
                            style: const TextStyle(
                              color: Color(0xff999ea1),
                              fontSize: 15,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                      GetBuilder<UserController>(
                        builder: (user) {
                          return const Text(
                            "CPF: ",
                            style: TextStyle(
                              color: Color(0xff999ea1),
                              fontSize: 15,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                      GetBuilder<UserController>(
                        builder: (user) {
                          return Text(
                            "Celular: ${user.userPhone()}",
                            style: const TextStyle(
                              color: Color(0xff999ea1),
                              fontSize: 15,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                      GetBuilder<UserController>(
                        builder: (user) {
                          return Text(
                            "E-mail: ${user.userEmail()}",
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
                              '${address.addressDistric()}, ${address.addressCep()}',
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
      ]),
    );
  }
}
