import 'app_repository.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final isLoggedIn = false.obs;
  final appRepo = Get.find<AppRepository>();

  final obsName = ''.obs;
  final obsBatch = ''.obs;

  String batch = '';
  String name = '';

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> checkLogIn() async {
    isLoggedIn(appRepo.getAuthRepository().isLoggedIn());
    if (isLoggedIn.isTrue) {
      var response = await appRepo.getAuthRepository().getCacheResponse();
      try {
        if (response != null) {
          batch = response.email.substring(2, 8).toUpperCase();
          name = response.name;
          obsName(name);
          obsBatch(batch);
        }
      } catch (e) {
        print(e);
      }
    }
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
