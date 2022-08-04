class Product {
  String? id;
  String? sellerId;
  String? brand;
  String? type;
  int? product_type;
  double? price;
  String? createdAt;
  String? updatedAt;

  Product({this.id, this.sellerId, this.brand, this.type, this.product_type, this.price, this.createdAt, this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    brand = json['brand'];
    type = json['type'];
    product_type = json['product_type'];
    price = json['price'] == null ? 0.0 : json['price'].toDouble();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
