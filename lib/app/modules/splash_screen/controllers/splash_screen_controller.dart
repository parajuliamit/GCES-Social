import 'package:gces_social/app/app_controller.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() async {
    if (await Get.find<AppController>().checkLogIn()) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGOUT);
    }
  }
}
