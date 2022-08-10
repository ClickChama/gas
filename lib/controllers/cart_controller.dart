// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt valor = 0.obs;

  bool isLoading = false;

  Future<void> setValue() async {
    valor.value++;
  }
}
