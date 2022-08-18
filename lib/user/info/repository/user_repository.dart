import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:gas/configs/urlconfigs.dart';
import 'package:gas/pages/models/user.dart';
import 'package:gas/user/info/user_result/user_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<UserResult<List<UserModel>>> getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var fullUrl = Uri.parse('$BASE_API/auth/customer/info');
    var token = localStorage.getString('token');
    _setHeaders() => {
          HttpHeaders.authorizationHeader: '$token',
        };
    final response = await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
    String responseBody = response.body;
    final results = [jsonDecode(response.body)];
    if (response.statusCode != 200) {
      return UserResult<List<UserModel>>.error('erro');
    } else {
      List<UserModel> data = List<Map<String, dynamic>>.from(results).map(UserModel.fromJson).toList();
      return UserResult<List<UserModel>>.success(data);
    }
  }
}
