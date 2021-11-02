import 'package:dio/dio.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/blog/blog_detail_response.dart';
import 'package:get/get.dart';

import '../../../app_repository.dart';

class ViewBlogController extends GetxController {
  final isLoading = false.obs;
  final blog = BlogDetailResponse().obs;
  final errorMessage = 'Server Error'.obs;
  final isError = false.obs;
  final blogRepo = Get.find<AppRepository>().getBlogRepository();

  void getBlogDetail(String id) async {
    isLoading.toggle();
    isError(false);
    try {
      blog(await blogRepo.getBlogDetail(id));
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      isError(true);
      print(e);
      if (e is DioError) {
        errorMessage(ServerError.withError(error: e).getErrorMessage());
      } else {
        errorMessage(e.toString());
      }
    }
  }
}
