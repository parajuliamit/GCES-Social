import 'package:flutter/material.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/blog_tab_controller.dart';
import 'widgets/blog_card.dart';

class BlogTabView extends GetView<BlogTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Blog'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kGreenishBlue,
          onPressed: () {
            Get.toNamed(Routes.WRITE_BLOG);
          },
          child: const Icon(Icons.add),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: Loading())
              : controller.isError.value
                  ? ErrorPage(
                      controller.errorMessage.value, controller.getBlogs)
                  : RefreshIndicator(
                      onRefresh: () async {
                        controller.getBlogs();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ListView.builder(
                            itemCount: controller.blogs.length,
                            itemBuilder: (context, index) {
                              return BlogCard(index);
                            }),
                      ),
                    ),
        ));
  }
}
