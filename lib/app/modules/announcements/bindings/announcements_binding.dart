import 'package:get/get.dart';

import '../controllers/announcements_controller.dart';

class AnnouncementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementsController>(
      () => AnnouncementsController(),
    );
  }
}
