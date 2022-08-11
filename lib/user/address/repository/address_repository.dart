import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:gas/configs/urlconfigs.dart';
import 'package:gas/pages/models/adress.dart';
import 'package:gas/user/address/address_result/address_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressRepository {
  Future<AddressResult<List<AdressModel>>> getAddress() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var fullUrl = Uri.parse('$BASE_API/adress/get');
    var id = localStorage.getString('id_user');
    final response = await http.post(
      fullUrl,
      body: {
        'id': id,
      },
    );
    String responseBody = response.body;
    final results = [jsonDecode(response.body)];
    if (response.statusCode != 200) {
      return AddressResult<List<AdressModel>>.error('erro');
    } else {
      List<AdressModel> data = List<Map<String, dynamic>>.from(results).map(AdressModel.fromJson).toList();
      return AddressResult<List<AdressModel>>.success(data);
    }
  }

  Future storeAddress(
    address,
    number,
    complement,
    district,
    city,
    state,
    zipCode,
  ) async {
    var url = Uri.parse('$BASE_API/adress/store');
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var id = localStorage.getString('id_user');
    _setHeaders() => {
          HttpHeaders.authorizationHeader: '$token',
        };
    var response = await http.post(
      url,
      headers: _setHeaders(),
      body: {
        'id': id,
        'address': address,
        'number': number,
        'complement': complement,
        'district': district,
        'city': city,
        'state': state,
        'zip_code': zipCode,
      },
    );
    String responseBody = response.body;
    final results = [jsonDecode(response.body)];
    if (response.statusCode != 200) {
      return AddressResult<List<AdressModel>>.error('erro');
    } else {
      List<AdressModel> data = List<Map<String, dynamic>>.from(results).map(AdressModel.fromJson).toList();
      return AddressResult<List<AdressModel>>.success(data);
    }
  }
}
