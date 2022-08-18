import 'package:gas/order/order_result/order_result.dart';
import 'package:gas/order/repository/order_repository.dart';
import 'package:gas/pages/models/order.dart';
import 'package:get/get.dart';

class OrderContrller extends GetxController {
  final orderRepository = OrderRepository();

  List<OrderModel> orderItems = [];

  @override
  void onInit() {
    super.onInit();
    getOrder();
  }

  Future<void> getOrder() async {
    final OrderResult<List<OrderModel>> result = await orderRepository.getOrder();
    result.when(success: (data) {
      orderItems = data;

      update();
    }, error: (message) {
      print('erro');
    });
  }

  Future<void> storeOrder() async {
    final OrderResult<List<OrderModel>> result = await orderRepository.storeOrder();

    result.when(success: (data) {
      print(data);
    }, error: (message) {
      print('erro');
    });
  }
}
