import 'package:get/get.dart';

import '../controllers/view_assignment_controller.dart';

class ViewAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAssignmentController>(
      () => ViewAssignmentController(),
    );
  }
}
