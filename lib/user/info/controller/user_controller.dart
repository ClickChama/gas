import 'package:gas/pages/models/user.dart';
import 'package:gas/user/info/repository/user_repository.dart';
import 'package:gas/user/info/user_result/user_result.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final userRespository = UserRepository();

  List<UserModel> userInfo = [];

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  String userName() {
    String name = '';
    for (final item in userInfo) {
      name += item.name ?? '';
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

  Future<void> getUser() async {
    final UserResult<List<UserModel>> result = await userRespository.getUser();
    result.when(success: (data) {
      userInfo = data;

      update();
    }, error: (message) {
      print('erro');
    });
  }
}
