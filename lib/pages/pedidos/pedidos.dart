import 'package:flutter/material.dart';
import 'package:gas/order/controller/order_controller.dart';
import 'package:gas/pages/MainPage.dart';
import 'package:get/get.dart';

class TodosPedidosPage extends StatefulWidget {
  const TodosPedidosPage({Key? key}) : super(key: key);

  @override
  State<TodosPedidosPage> createState() => _TodosPedidosPageState();
}

class _TodosPedidosPageState extends State<TodosPedidosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 110,
          color: const Color(0xff4e0189),
          child: Row(children: [
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            const Expanded(
              flex: 7,
              child: Text(
                "Meus Pedidos",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.81,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Row(children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Image.asset('assets/img/yellow.png'),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Novos",
                      style: TextStyle(
                        color: Color(0xff999ea1),
                        fontSize: 12.22,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Image.asset('assets/img/red.png'),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Cancelados",
                      style: TextStyle(
                        color: Color(0xff999ea1),
                        fontSize: 12.22,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Image.asset('assets/img/green.png'),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Entregues",
                      style: TextStyle(
                        color: Color(0xff999ea1),
                        fontSize: 12.22,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
        Expanded(
          child: GetBuilder<OrderContrller>(
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.orderItems.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.getOrderById(controller.orderItems[index].id);
                    },
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.all(26),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Revenda ${controller.orderItems[index].seller!.name}",
                            style: const TextStyle(
                              color: Color(0xff999ea1),
                              fontSize: 15,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    '${controller.orderItems[index].seller!.name}',
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
                                children: [
                                  Text(
                                    "Pedido #${controller.orderItems[index].id?.substring(1, 5)}",
                                    maxLines: 2,
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    style: const TextStyle(
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
                        )
                      ]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    ));
  }
}
