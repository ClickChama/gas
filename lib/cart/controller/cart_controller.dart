import 'dart:async';

import 'package:gas/cart/cart_result/cart_result.dart';
import 'package:gas/cart/repository/cart_repository.dart';
import 'package:gas/pages/models/cart.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class CartController extends GetxController {
  final cartRespository = CartRepository();

  List<CartModel> cartItems = [];
  CartModel cart = CartModel();

  @override
  void onInit() {
    getCartItems();
    getCart();
    super.onInit();
  }

  getCart() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      getCartItems();
      // print('procurando...');
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (final item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  int cartQty() {
    int qty = 0;
    cartItems.forEachIndexed((index, element) {
      qty += element.quantity!;
    });
    return qty;
  }

  String sellerId() {
    String total = '';
    cartItems.forEachIndexed((index, element) {
      if (index == 0) {
        total = element.sellerId!;
      }
    });
    return total;
  }

  Future<void> getCartItems() async {
    final CartResult<List<CartModel>> result = await cartRespository.getCartItems();
    result.when(success: (data) {
      cartItems = data;
    }, error: (message) {
      print('erro');
    });
    update();
  }

  int getItemIndex(CartModel item) {
    return cartItems.indexWhere((itemInList) => itemInList.id == item.id);
  }

  Future<void> addItemToCart({
    required String sellerId,
    required String id,
    required int quantity,
    required double price,
    required String brand,
    required String type,
    required int productType,
  }) async {
    final CartResult<List<CartModel>> result = await cartRespository.addItemToCart(
      brand: brand,
      id: id,
      price: price,
      productType: productType,
      quantity: quantity,
      type: type,
      sellerId: sellerId,
    );
    result.when(success: (data) {
      cartItems.add(CartModel(
        brand: brand,
        id: id,
        price: price,
        productType: productType,
        quantity: quantity,
        type: type,
        sellerId: sellerId,
      ));
    }, error: (message) {
      print('erro');
    });
    update();
  }
}
