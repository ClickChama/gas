import 'package:flutter/material.dart';
import 'package:gas/pages/MainPage.dart';
import 'package:gas/pages/userPage/MeusDados.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 110,
          color: Color(0xff4e0189),
          child: const Center(
            child: Text(
              "Meu Perfil",
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
          margin: EdgeInsets.only(top: 40.0),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MeusDadosPage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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

                child: Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "Dados Básicos",
                          style: TextStyle(
                            color: Color(0xff4e0189),
                            fontSize: 12.22,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(Icons.arrow_right_alt)
                      ]),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Alterar Senha",
                      style: TextStyle(
                        color: Color(0xff4e0189),
                        fontSize: 12.22,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.arrow_right_alt)
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Pedidos",
                      style: TextStyle(
                        color: Color(0xff4e0189),
                        fontSize: 12.22,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.arrow_right_alt)
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Notificações",
                      style: TextStyle(
                        color: Color(0xff4e0189),
                        fontSize: 12.22,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.arrow_right_alt)
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Políticas",
                      style: TextStyle(
                        color: Color(0xff4e0189),
                        fontSize: 12.22,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.arrow_right_alt)
                  ]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
                  color: Colors.redAccent,
                ),
                // ignore: prefer_const_literals_to_create_immutables
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  child: Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Voltar para Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.22,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(Icons.arrow_right_alt)
                        ]),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    ));
  }
}
