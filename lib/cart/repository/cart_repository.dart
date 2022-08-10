import 'dart:convert';

import 'package:gas/cart/cart_result/cart_result.dart';
import 'package:gas/configs/urlconfigs.dart';
import 'package:gas/pages/models/cart.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  Future<CartResult<List<CartModel>>> getCartItems() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var fullUrl = Uri.parse('$BASE_API/cart-get');
    var id = localStorage.getString('id_user');
    final response = await http.post(
      fullUrl,
      body: {
        'id': id,
      },
    );
    String responseBody = response.body;
    if (response.statusCode != 200) {
      return CartResult<List<CartModel>>.error('erro');
    } else {
      List<CartModel> data = List<Map<String, dynamic>>.from(jsonDecode(responseBody)).map(CartModel.fromJson).toList();
      return CartResult<List<CartModel>>.success(data);
    }
  }

  Future addItemToCart({
    required String sellerId,
    required String id,
    required int quantity,
    required double price,
    required String brand,
    required String type,
    required int productType,
  }) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var fullUrl = Uri.parse('$BASE_API/cart-add');
    var userId = localStorage.getString('id_user');
    final response = await http.post(
      fullUrl,
      headers: {
        "content-type": "application/json",
      },
      body: jsonEncode({"id": id, "seller_id": sellerId, "customer_id": userId, "brand": brand, "type": type, "price": price, "product_type": productType, "quantity": quantity}),
    );
    String responseBody = response.body;
    final results = [jsonDecode(response.body)];
    if (response.statusCode != 200) {
    } else {
      List<CartModel> data = List<Map<String, dynamic>>.from(results).map(CartModel.fromJson).toList();
      return CartResult<List<CartModel>>.success(data);
    }
  }
}
