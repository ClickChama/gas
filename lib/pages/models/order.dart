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
  int? status;
  String? paymentMethod;
  String? payback;
  List<OrderProducts>? orderProducts;
  Seller? seller;
  Customer? customer;
  CustomerAddress? customerAddress;

  OrderModel({this.id, this.sellerId, this.customerId, this.customerAddressId, this.quantity, this.totalPrice, this.createdAt, this.updatedAt, this.status, this.paymentMethod, this.payback, this.orderProducts, this.seller, this.customer, this.customerAddress});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    customerId = json['customer_id'];
    customerAddressId = json['customer_address_id'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    payback = json['payback'];
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(OrderProducts.fromJson(v));
      });
    }
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    customerAddress = json['customer_address'] != null ? CustomerAddress.fromJson(json['customer_address']) : null;
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
    data['status'] = status;
    data['payment_method'] = paymentMethod;
    data['payback'] = payback;
    if (orderProducts != null) {
      data['order_products'] = orderProducts!.map((v) => v.toJson()).toList();
    }
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (customerAddress != null) {
      data['customer_address'] = customerAddress!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, sellerId: $sellerId, customerId: $customerId, customerAddressId: $customerAddressId, quantity: $quantity, totalPrice: $totalPrice, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, paymentMethod: $paymentMethod, payback: $payback, orderProducts: $orderProducts, seller: $seller, customer: $customer, customerAddress: $customerAddress)';
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
  String? name;
  String? brand;

  OrderProducts({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.unitPrice,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.brand,
  });

  OrderProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    brand = json['brand'];
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
    data['name'] = name;
    data['brand'] = brand;
    return data;
  }

  @override
  String toString() {
    return 'OrderProducts(id: $id, orderId: $orderId, productId: $productId, quantity: $quantity, unitPrice: $unitPrice, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, brand: $brand)';
  }
}

class Seller {
  String? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? phoneVerifiedAt;
  String? serviceActive;
  String? createdAt;
  String? updatedAt;
  String? info;

  Seller({this.id, this.name, this.email, this.emailVerifiedAt, this.phone, this.phoneVerifiedAt, this.serviceActive, this.createdAt, this.updatedAt, this.info});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    serviceActive = json['service_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone'] = phone;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['service_active'] = serviceActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['info'] = info;
    return data;
  }

  @override
  String toString() {
    return 'Seller(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, phone: $phone, phoneVerifiedAt: $phoneVerifiedAt, serviceActive: $serviceActive, createdAt: $createdAt, updatedAt: $updatedAt, info: $info)';
  }
}

class Customer {
  String? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? phoneVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Customer({this.id, this.name, this.email, this.emailVerifiedAt, this.phone, this.phoneVerifiedAt, this.createdAt, this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone'] = phone;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CustomerAddress {
  String? id;
  String? customerId;
  String? address;
  String? number;
  String? complement;
  String? district;
  String? city;
  String? state;
  String? zipCode;
  String? lat;
  String? lng;
  String? createdAt;
  String? updatedAt;

  CustomerAddress({this.id, this.customerId, this.address, this.number, this.complement, this.district, this.city, this.state, this.zipCode, this.lat, this.lng, this.createdAt, this.updatedAt});

  CustomerAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    address = json['address'];
    number = json['number'];
    complement = json['complement'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    lat = json['lat'];
    lng = json['lng'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['address'] = address;
    data['number'] = number;
    data['complement'] = complement;
    data['district'] = district;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['lat'] = lat;
    data['lng'] = lng;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'CustomerAddress(id: $id, customerId: $customerId, address: $address, number: $number, complement: $complement, district: $district, city: $city, state: $state, zipCode: $zipCode, lat: $lat, lng: $lng, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
