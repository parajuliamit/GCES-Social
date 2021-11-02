import 'package:flutter/material.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/view_blog_controller.dart';

class ViewBlogView extends GetView<ViewBlogController> {
  @override
  Widget build(BuildContext context) {
    controller.getBlogDetail(Get.parameters['id']!);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Blog'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getBlogDetail(Get.parameters['id']!);
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        child: Icon(
                          Icons.account_circle,
                          size: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.parameters['user']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          Text(convertToAgo(
                              DateTime.parse(Get.parameters['time']!)))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: Loading(),
                          )
                        : controller.isError.value
                            ? ErrorPage(
                                controller.errorMessage.value,
                                () => controller
                                    .getBlogDetail(Get.parameters['id']!))
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.blog.value.title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    controller.blog.value.content,
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        controller.blog.value.likes.toString(),
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.thumb_up,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      const Text(
                                        '10',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.messenger_outlined,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        'View Comments',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
