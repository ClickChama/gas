// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderModel {
  String? id;
  String? sellerId;
  String? customerId;
  String? customerAddressId;
  String? quantity;
  String? totalPrice;
  String? createdAt;
  String? updatedAt;
  List<OrderProducts>? orderProducts;

  OrderModel({this.id, this.sellerId, this.customerId, this.customerAddressId, this.quantity, this.totalPrice, this.createdAt, this.updatedAt, this.orderProducts});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    customerId = json['customer_id'];
    customerAddressId = json['customer_address_id'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seller_id'] = sellerId;
    data['customer_id'] = customerId;
    data['customer_address_id'] = customerAddressId;
    data['quantity'] = quantity;
    data['total_price'] = totalPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (orderProducts != null) {
      data['order_products'] = orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, sellerId: $sellerId, customerId: $customerId, customerAddressId: $customerAddressId, quantity: $quantity, totalPrice: $totalPrice, createdAt: $createdAt, updatedAt: $updatedAt, orderProducts: $orderProducts)';
  }
}

class OrderProducts {
  String? id;
  String? orderId;
  String? productId;
  String? quantity;
  String? unitPrice;
  String? createdAt;
  String? updatedAt;

  OrderProducts({this.id, this.orderId, this.productId, this.quantity, this.unitPrice, this.createdAt, this.updatedAt});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['unit_price'] = unitPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'OrderProducts(id: $id, orderId: $orderId, quantity: $quantity, unitPrice: $unitPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
