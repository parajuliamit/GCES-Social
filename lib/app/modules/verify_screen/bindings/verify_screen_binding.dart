import 'package:get/get.dart';

import '../controllers/verify_screen_controller.dart';

class VerifyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyScreenController>(
      () => VerifyScreenController(),
    );
  }
}
