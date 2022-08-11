import 'package:flutter/material.dart';
import 'package:gas/myapp.dart';
import 'package:gas/user/address/controller/address_controller.dart';
import 'package:get/get.dart';
import 'cart/controller/cart_controller.dart';
import 'user/info/controller/user_controller.dart';

void main() {
  Get.put(UserController());
  Get.put(AddressController());
  Get.put(CartController());

  runApp(const MyApp());
}
