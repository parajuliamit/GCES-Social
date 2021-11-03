import 'package:get/get.dart';

import '../controllers/assignment_screen_controller.dart';

class AssignmentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignmentScreenController>(
      () => AssignmentScreenController(),
    );
  }
}
