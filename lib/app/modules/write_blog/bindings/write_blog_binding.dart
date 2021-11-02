import 'package:get/get.dart';

import '../controllers/write_blog_controller.dart';

class WriteBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WriteBlogController>(
      () => WriteBlogController(),
    );
  }
}
