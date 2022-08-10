import 'package:flutter/material.dart';
import 'package:gas/configs/urlconfigs.dart';
import 'package:gas/pages/checkout/checkout.dart';
import 'package:gas/pages/models/products.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quantity_input/quantity_input.dart';
import 'package:flutter_cart/flutter_cart.dart';

import '../../cart/controller/cart_controller.dart';

class SellerProducts extends StatefulWidget {
  final String id;
  const SellerProducts({Key? key, required this.id}) : super(key: key);

  @override
  State<SellerProducts> createState() => _SellerProductsState();
}

class _SellerProductsState extends State<SellerProducts> {
  final cartController = Get.find<CartController>();
  var cart = FlutterCart();
  late Future<List<Product>> products;
  int simpleIntInput = 1;

  @override
  void initState() {
    products = getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(children: [
          SizedBox(
            width: double.infinity,
            height: 160,
            child: Container(
              color: const Color(0xff4e0189),
              child: SizedBox(
                width: double.infinity,
                height: 147,
                child: Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0, left: 12.0),
                        child: Text(
                          'Voltar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Container(
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
                margin: const EdgeInsets.only(top: 130.0),
                width: double.infinity,
                height: 80,
                // ignore: sort_child_properties_last
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/img/chama.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Supergasbras",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "Revenda Supergasbras",
                            style: TextStyle(
                              color: Color(0xff999ea1),
                              fontSize: 15,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset('assets/img/estrela1.png'),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  '5,0',
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
                      ],
                    )
                  ],
                )),
          ),
        ]),
        Container(
          child: FutureBuilder<List<Product>>(
              future: products,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Product product = snapshot.data![index];
                      return ListTile(
                        title: Container(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (product.product_type == 1) ...[
                                  Image.asset('assets/img/bujao.png'),
                                ] else ...[
                                  Image.asset('assets/img/agua.png'),
                                ],
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        product.brand!,
                                        style: const TextStyle(
                                          color: Color(0xff999ea1),
                                          fontSize: 15,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/img/clock1.png'),
                                          const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              '40-50 min',
                                              style: TextStyle(
                                                color: Color(0xff4e0189),
                                                fontSize: 12.22,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/img/money1.png'),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              'R\$ ${product.price}',
                                              style: const TextStyle(
                                                color: Color(0xff4e0189),
                                                fontSize: 12.22,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: QuantityInput(
                                        value: simpleIntInput,
                                        onChanged: (value) => setState(() => simpleIntInput = int.parse(value.replaceAll(',', ''))),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  cartController.addItemToCart(
                                    sellerId: product.sellerId!,
                                    id: product.id!,
                                    quantity: simpleIntInput,
                                    price: product.price!,
                                    brand: product.brand!,
                                    type: product.type!,
                                    productType: product.product_type!,
                                  );
                                },
                                child: const Text('Adicionar ao carrinho'),
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const CircularProgressIndicator();
              }),
        ),
        GetBuilder<CartController>(
          init: cartController,
          builder: (controller) {
            if (controller.cartItems.isNotEmpty) {
              return Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 47,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 47,
                          color: const Color(0xfff1e4e2),
                          padding: const EdgeInsets.only(
                            left: 52,
                            right: 47,
                            top: 14,
                            bottom: 13,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "R\$ ${controller.cartTotalPrice()}",
                                style: const TextStyle(
                                  color: Color(0xff4e0189),
                                  fontSize: 16.82,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 47,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (_) => const CheckoutPage()),
                                  );
                                },
                                child: Container(
                                  width: 220,
                                  height: 47,
                                  color: const Color(0xffe24329),
                                  padding: const EdgeInsets.only(
                                    left: 25,
                                    right: 17,
                                    top: 15,
                                    bottom: 14,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Forma de Pagamento",
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
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center();
            }
          },
        )
      ]),
    );
  }

  Future<List<Product>> getProduct() async {
    var fullUrl = Uri.parse('$BASE_API/get-all-products/${widget.id}');
    var product = await http.get(fullUrl);
    String responseBody = product.body;
    if (product.statusCode == 200) {
      List listSellers = jsonDecode(responseBody);
      // print(listSellers);
      return listSellers.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Deu erro');
    }
  }
}
