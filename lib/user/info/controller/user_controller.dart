import 'dart:async';

import 'package:gas/pages/models/user.dart';
import 'package:gas/user/info/repository/user_repository.dart';
import 'package:gas/user/info/user_result/user_result.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final userRespository = UserRepository();

  List<UserModel> userInfo = [];

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  String userName() {
    String name = '';
    for (final item in userInfo) {
      name += item.name!;
    }
    return name;
  }

  String userEmail() {
    String name = '';
    for (final item in userInfo) {
      name += item.email ?? '';
    }
    return name;
  }

  String userPhone() {
    String name = '';
    for (final item in userInfo) {
      name += item.phone ?? '';
    }
    return name;
  }

 

  String getId() {
    String name = '';
    // ignore: avoid_function_literals_in_foreach_calls
    userInfo.forEach((element) {
      name = element.id!;
    });
    return name;
  }

  Future<void> getUser() async {
    final UserResult<List<UserModel>> result = await userRespository.getUser();
    result.when(success: (data) {
      userInfo = data;
      update();
    }, error: (message) {
      print('erro');
    });
    update();
  }
}
