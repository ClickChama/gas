import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:gas/configs/urlconfigs.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserAddress extends ChangeNotifier {
  // ignore: prefer_typing_uninitialized_variables
  var endereco;

  Future<void> getAddress() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var id = localStorage.getString('id_user');
    _setHeaders() => {
          HttpHeaders.authorizationHeader: '${token}',
        };
    var fullUrl = Uri.parse('$BASE_API/adress/get/$id');
    var address = await http.get(fullUrl, headers: _setHeaders());
    String responseBody = address.body;
    if (address.statusCode == 200) {
      endereco = jsonDecode(responseBody)['address'];
      notifyListeners();
      return endereco;
    }
  }
}
