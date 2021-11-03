import 'package:get/get.dart';

import '../controllers/attendance_screen_controller.dart';

class AttendanceScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceScreenController>(
      () => AttendanceScreenController(),
    );
  }
}
