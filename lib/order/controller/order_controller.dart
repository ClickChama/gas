import 'dart:async';

import 'package:gas/order/order_result/order_result.dart';
import 'package:gas/order/repository/order_repository.dart';
import 'package:gas/pages/models/order.dart';
import 'package:gas/pages_routes/app_pages.dart';
import 'package:get/get.dart';

class OrderContrller extends GetxController {
  final orderRepository = OrderRepository();

  List<OrderModel> orderItems = [];
  List<OrderModel> orderIten = [];
  RxInt status = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getOrder();
    verifyOrder();
  }

  verifyOrder() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      getOrder();
    });
  }

  Future<void> getOrderById(id) async {
    final OrderResult<List<OrderModel>> result = await orderRepository.getOrderById(id);
    result.when(success: (data) {
      orderIten = data;
      status.value = data.last.status!;
      Get.offAllNamed(PagesRoutes.PedidoRoute, arguments: orderIten);
    }, error: (message) {
      print('erro');
    });
    update();
  }

  Future<void> getOrder() async {
    final OrderResult<List<OrderModel>> result = await orderRepository.getOrder();
    result.when(success: (data) {
      orderItems = data;
    }, error: (message) {
      print('erro');
    });
    update();
  }

  Future<void> storeOrder(payment, payback) async {
    final OrderResult<List<OrderModel>> result = await orderRepository.storeOrder(payment, payback);

    result.when(success: (data) {
      orderIten = data;
      getOrderById(data.last.id);
      // Get.offAllNamed(PagesRoutes.PedidoRoute, arguments: orderIten.last);
    }, error: (message) {
      print('erro');
    });
    update();
  }
}
