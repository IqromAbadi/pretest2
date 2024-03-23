import 'package:get/get_connect/connect.dart';
import 'package:pretest2/models/user_model.dart';

class UserProvider extends GetConnect {
  Future<UserModel> getUsers() async {
    final response = await get('https://randomuser.me/api/?results=10');
    if (response.status.hasError) {
      throw Exception(response.statusText!);
    } else {
      final userModel = UserModel.fromJson(response.body);
      return userModel;
    }
  }
}
