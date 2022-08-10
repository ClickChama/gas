import 'package:gas/cart/cart_result/cart_result.dart';
import 'package:gas/cart/repository/cart_repository.dart';
import 'package:gas/pages/models/cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartRespository = CartRepository();

  List<CartModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  double cartTotalPrice() {
    double total = 0;

    for (final item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  Future<void> getCartItems() async {
    final CartResult<List<CartModel>> result = await cartRespository.getCartItems();
    result.when(success: (data) {
      cartItems = data;
      update();
    }, error: (message) {
      print('erro');
    });
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
