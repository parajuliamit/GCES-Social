import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/blog/blog_detail_response.dart';
import 'package:gces_social/app/data/models/blog/write_blog_request.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../app_repository.dart';

class WriteBlogController extends GetxController {
  final appRepo = Get.find<AppRepository>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  final isLoading = false.obs;

  void postBlog() async {
    if (titleController.text.isEmpty) {
      Get.rawSnackbar(
          message: 'Title can\'t be empty.',
          duration: const Duration(seconds: 2));
      return;
    }
    if (contentController.text.isEmpty) {
      Get.rawSnackbar(
          message: 'Content can\'t be empty.',
          duration: const Duration(seconds: 2));
      return;
    }
    isLoading(true);
    try {
      WriteBlogRequest writeBlogRequest = WriteBlogRequest(
          title: titleController.text, content: contentController.text);

      BlogDetailResponse response =
          await appRepo.getBlogRepository().writeBlog(writeBlogRequest);

      isLoading(false);
      Get.offNamed(Routes.VIEW_BLOG, parameters: {
        "id": response.id.toString(),
        "user": response.user,
        "time": response.createdAt
      });
      Get.rawSnackbar(
          title: 'Successfully posted!',
          message: 'Waiting for admin\'s approval.',
          duration: const Duration(seconds: 2));
      return;
    } catch (e) {
      print(e);
      String errorText;
      if (e is DioError) {
        errorText = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorText = e.toString();
      }
      Get.rawSnackbar(message: errorText, duration: const Duration(seconds: 3));
    }
    isLoading(false);
  }
}
