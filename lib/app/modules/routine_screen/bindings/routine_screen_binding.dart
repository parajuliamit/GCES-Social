import 'package:get/get.dart';

import '../controllers/routine_screen_controller.dart';

class RoutineScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoutineScreenController>(
      () => RoutineScreenController(),
    );
  }
}
