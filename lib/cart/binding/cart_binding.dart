import 'package:gas/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBindig extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
