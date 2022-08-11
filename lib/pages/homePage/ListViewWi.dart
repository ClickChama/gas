import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas/configs/urlconfigs.dart';
import 'package:gas/pages/homePage/ListProducts.dart';
import 'package:gas/pages/models/sellers.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  late Future<List<Sellers>> sellers;
  var id;

  @override
  void initState() {
    sellers = getProduct();
    super.initState();
  }

  Future<List<Sellers>> getProduct() async {
    var fullUrl = Uri.parse('$BASE_API/get-seller-products');

    var product = await http.get(fullUrl);
    String responseBody = product.body;
    if (product.statusCode == 200) {
      List listSellers = jsonDecode(responseBody);
      return listSellers.map((json) => Sellers.fromJson(json)).toList();
    } else {
      throw Exception('Deu erro');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: FutureBuilder<List<Sellers>>(
        future: sellers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Sellers seller = snapshot.data![index];
                  return ListTile(
                    title: GestureDetector(
                      onTap: () {
                        var id = seller.id;
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text(seller.name!),
                                ElevatedButton(
                                    onPressed: () => {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => SellerProducts(id: id!),
                                              ))
                                        },
                                    child: const Text('comprar')),
                              ]),
                            ),
                          ),
                        );
                      },
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
                        width: double.infinity,
                        height: 93,
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        seller.name!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                child: Text(
                                  'Revenda ${seller.name!}',
                                  style: const TextStyle(
                                    color: Color(0xff999ea1),
                                    fontSize: 15,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset('assets/img/pin1.png'),
                                    const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text(
                                        "5 km",
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset('assets/img/money1.png'),
                                    const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text(
                                        "95.00",
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
                            ],
                          )
                        ]),
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
