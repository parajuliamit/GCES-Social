import 'package:gces_social/app/app_controller.dart';
import 'package:gces_social/app/app_repository.dart';
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
      var routine;
      try {
        routine = await Get.find<AppRepository>()
            .getRoutineRepository()
            .getRoutine('2017SE');
      } catch (e) {
        print(e);
      }
      Get.offAllNamed(Routes.HOME, arguments: routine);
    } else {
      Get.offAllNamed(Routes.LOGOUT);
    }
  }
}
