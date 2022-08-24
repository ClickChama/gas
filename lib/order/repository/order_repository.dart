import 'dart:convert';
import 'dart:io';
import 'package:gas/cart/controller/cart_controller.dart';
import 'package:gas/user/address/controller/address_controller.dart';
import 'package:gas/user/info/controller/user_controller.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:gas/configs/urlconfigs.dart';
import 'package:gas/order/order_result/order_result.dart';
import 'package:gas/pages/models/order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepository {
  final cartController = Get.find<CartController>();
  final userController = Get.find<UserController>();
  final addressController = Get.find<AddressController>();
  Future<OrderResult<List<OrderModel>>> getOrder() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var fullUrl = Uri.parse('$BASE_API/customer/order');
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
      List<OrderModel> data = List<Map<String, dynamic>>.from(results[0]).map(OrderModel.fromJson).toList();
      return OrderResult<List<OrderModel>>.success(data);
    }
  }

  Future<OrderResult<List<OrderModel>>> getOrderById(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var fullUrl = Uri.parse('$BASE_API/customer/order/$id');
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
      List<OrderModel> data = List<Map<String, dynamic>>.from(results).map(OrderModel.fromJson).toList();
      return OrderResult<List<OrderModel>>.success(data);
    }
  }

  Future storeOrder(payment, payback) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var fullUrl = Uri.parse('$BASE_API/customer/order');
    var token = localStorage.getString('token');
    var userId = localStorage.getString('id_user');
    var map2 = {
      "seller_id": cartController.sellerId(),
      "customer_id": userId,
      // "customer_address_id": addressController.addressId(),
      "customer_address_id": 'string',
      "quantity": cartController.cartQty(),
      "total_price": cartController.cartTotalPrice(),
      "products": [
        for (var customer in cartController.cartItems)
          {
            "product_id": customer.id,
            "quantity": customer.quantity,
            "unit_price": customer.price,
            "brand": customer.brand,
            "name": customer.productType.toString(),
          }
      ],
      "payment_method": payment.toString(),
      "payback": payback,
    };
    _setHeaders() => {
          HttpHeaders.authorizationHeader: '$token',
          "content-type": "application/json",
        };

    final response = await http.post(fullUrl, headers: _setHeaders(), body: jsonEncode(map2));
    String responseBody = response.body;
    final results = [jsonDecode(response.body)];
    if (response.statusCode != 200) {
      return OrderResult<List<OrderModel>>.error('erro');
    } else {
      List<OrderModel> data = List<Map<String, dynamic>>.from(results).map(OrderModel.fromJson).toList();
      return OrderResult<List<OrderModel>>.success(data);
    }
  }
}
