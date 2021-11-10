import 'app_repository.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final isLoggedIn = false.obs;
  final appRepo = Get.find<AppRepository>();

  String batch = '2017SE';

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> checkLogIn() async {
    isLoggedIn(appRepo.getAuthRepository().isLoggedIn());
    return isLoggedIn.value;
  }

  void logout() {
    appRepo.getAuthRepository().logout();
    isLoggedIn(false);
  }

  void login() {
    isLoggedIn(true);
  }
}
