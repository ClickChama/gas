import 'package:flutter/material.dart';
import 'package:gas/myapp.dart';
import 'package:get/get.dart';

import 'cart/controller/cart_controller.dart';

void main() {
  Get.put(CartController());
  runApp(const MyApp());
}
