import 'package:get/get.dart';

class AppController extends GetxController {
  final isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> checkLogIn() async {
    await Future.delayed(const Duration(seconds: 2));
    return isLoggedIn.value;
  }

  void logout() {
    isLoggedIn(false);
  }

  void login() {
    isLoggedIn(true);
  }
}
