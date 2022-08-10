// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  String? id;
  String? sellerId;
  String? customerId;
  String? brand;
  String? type;
  double? price;
  int? productType;
  int? quantity;

  CartModel({this.id, this.sellerId, this.customerId, this.brand, this.type, this.price, this.productType, this.quantity});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    customerId = json['customer_id'];
    brand = json['brand'];
    type = json['type'];
    price = json['price'] == null ? 0.0 : json['price'].toDouble();
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seller_id'] = sellerId;
    data['customer_id'] = customerId;
    data['brand'] = brand;
    data['type'] = type;
    data['price'] = price!.toDouble();
    data['product_type'] = productType;
    data['quantity'] = quantity;
    return data;
  }

  double totalPrice() => price! * quantity!;

  @override
  String toString() {
    return 'CartModel(id: $id, sellerId: $sellerId, customerId: $customerId, brand: $brand, type: $type, price: $price,  quantity: $quantity)';
  }
}
