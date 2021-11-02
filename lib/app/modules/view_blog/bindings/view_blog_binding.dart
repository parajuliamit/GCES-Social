import 'package:get/get.dart';

import '../controllers/view_blog_controller.dart';

class ViewBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewBlogController>(
      () => ViewBlogController(),
    );
  }
}
