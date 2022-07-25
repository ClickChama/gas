class Sellers {
  String? id;
  String? name;
  String? phone;
  String? serviceActive;
  List<Products>? products;
  Info? info;

  Sellers(
      {this.id,
      this.name,
      this.phone,
      this.serviceActive,
      this.products,
      this.info});

  Sellers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    serviceActive = json['service_active'];
 
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }


}

class Products {
  String? id;
  String? sellerId;
  String? brand;
  String? type;
  double? price;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
      this.sellerId,
      this.brand,
      this.type,
      this.price,
      this.createdAt,
      this.updatedAt});



}

class Info {
  String? id;
  String? sellerId;
  String? appName;
  String? appPhone;
  String? cnpj;
  String? corporateName;
  String? address;
  String? number;
  String? complement;
  String? district;
  String? city;
  String? state;
  String? zipCode;
  int? deliveryRadius;
  int? deliveryTime;
  Null? lat;
  Null? lng;
  String? createdAt;
  String? updatedAt;

  Info(
      {this.id,
      this.sellerId,
      this.appName,
      this.appPhone,
      this.cnpj,
      this.corporateName,
      this.address,
      this.number,
      this.complement,
      this.district,
      this.city,
      this.state,
      this.zipCode,
      this.deliveryRadius,
      this.deliveryTime,
      this.lat,
      this.lng,
      this.createdAt,
      this.updatedAt});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    appName = json['app_name'];
    appPhone = json['app_phone'];
    cnpj = json['cnpj'];
    corporateName = json['corporate_name'];
    address = json['address'];
    number = json['number'];
    complement = json['complement'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    deliveryRadius = json['delivery_radius'];
    deliveryTime = json['delivery_time'];
    lat = json['lat'];
    lng = json['lng'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
