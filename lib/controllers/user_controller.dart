import 'package:get/get.dart';
import 'package:pretest2/models/user_model.dart';
import 'package:pretest2/provider/user_provider.dart';

class UserController extends GetxController {
  final UserProvider _userProvider = UserProvider();

  RxList<Result> users = <Result>[].obs;
  RxBool isLoading = true.obs;

  Future<void> getUsers() async {
    try {
      isLoading(true);
      users.clear();
      final usersData = await _userProvider.getUsers();
      users.addAll(usersData.results);
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading(false);
    }
  }
}
