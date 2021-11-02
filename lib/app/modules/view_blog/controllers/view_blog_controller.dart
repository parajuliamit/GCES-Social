import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/blog/blog_detail_response.dart';
import 'package:gces_social/app/data/models/blog/comment_request.dart';
import 'package:get/get.dart';

import '../../../app_repository.dart';

class ViewBlogController extends GetxController {
  final isLoading = false.obs;
  final blog = BlogDetailResponse().obs;
  final errorMessage = 'Server Error'.obs;
  final isError = false.obs;
  final blogRepo = Get.find<AppRepository>().getBlogRepository();

  final TextEditingController commentController = TextEditingController();
  final isCommentPosting = false.obs;

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

  void postComment(String blogId) async {
    if (commentController.text.isEmpty) {
      Get.rawSnackbar(
          message: 'Can\'t post empty comment.',
          duration: const Duration(seconds: 2));
      return;
    }
    isCommentPosting(true);
    try {
      CommentRequest commentRequest =
          CommentRequest(comment: commentController.text, blog: blogId);

      await blogRepo.postComment(commentRequest);
      isCommentPosting(false);
      Get.rawSnackbar(
          message: 'Successfully posted!',
          duration: const Duration(seconds: 2));
      commentController.clear();
      getBlogDetail(blogId);
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
    isCommentPosting(false);
  }

  Future<void> likeBlog() async {
    try {
      blog.value.liked = !blog.value.liked;
      if (blog.value.liked) {
        blog.value.totalLikes++;
      } else {
        blog.value.totalLikes--;
      }
      update();
      await blogRepo.likeBlog(blog.value.id.toString());
    } catch (e) {
      print(e);
    }
  }
}
