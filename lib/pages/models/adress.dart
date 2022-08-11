// ignore_for_file: public_member_api_docs, sort_constructors_first
class AdressModel {
  String? id;
  String? customerId;
  String? address;
  String? number;
  String? complement;
  String? district;
  String? city;
  String? state;
  String? zipCode;
  void lat;
  void lng;
  String? createdAt;
  String? updatedAt;

  AdressModel({this.id, this.customerId, this.address, this.number, this.complement, this.district, this.city, this.state, this.zipCode, this.lat, this.lng, this.createdAt, this.updatedAt});

  AdressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    address = json['address'];
    number = json['number'];
    complement = json['complement'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'AdressModel(id: $id, customerId: $customerId, address: $address, number: $number, complement: $complement, district: $district, city: $city, state: $state, zipCode: $zipCode, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
