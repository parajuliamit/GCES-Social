import 'package:dio/dio.dart';
import 'package:gces_social/app/app_repository.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/blog/blog_response.dart';
import 'package:get/get.dart';

class BlogTabController extends GetxController {
  final isLoading = false.obs;
  final blogs = <BlogResponse>[].obs;
  final errorMessage = 'Server Error'.obs;
  final isError = false.obs;
  final blogRepo = Get.find<AppRepository>().getBlogRepository();
  @override
  void onInit() {
    super.onInit();
    getBlogs();
  }

  Future<void> getBlogs() async {
    isLoading.toggle();
    isError(false);
    try {
      blogs.assignAll((await blogRepo.getBlogs()).reversed);

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

  Future<void> likeBlog(int index) async {
    try {
      blogs[index].liked = !blogs[index].liked;
      if (blogs[index].liked) {
        blogs[index].totalLikes++;
      } else {
        blogs[index].totalLikes--;
      }
      update();
      await blogRepo.likeBlog(blogs[index].id.toString());
    } catch (e) {
      print(e);
    }
  }
}
