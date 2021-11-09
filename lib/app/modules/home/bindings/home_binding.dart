import 'package:gces_social/app/modules/announcements/controllers/announcements_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../blog_tab/controllers/blog_tab_controller.dart';
import '../../home_tab/controllers/home_tab_controller.dart';
import '../../message_tab/controllers/message_tab_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeTabController>(() => HomeTabController());
    Get.lazyPut<AnnouncementsController>(() => AnnouncementsController());
    Get.lazyPut<BlogTabController>(() => BlogTabController());
  }
}
