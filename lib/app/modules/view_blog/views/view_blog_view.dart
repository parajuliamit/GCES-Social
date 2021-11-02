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
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      controller.blog.value.title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      controller.blog.value.content,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          controller.blog.value.likes
                                              .toString(),
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
                                        Text(
                                          controller.blog.value.commentCount
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.messenger_outlined,
                                          color: Colors.grey,
                                        ),
                                        // const SizedBox(
                                        //   width: 5,
                                        // ),
                                        // const Text(
                                        //   'View Comments',
                                        //   style: TextStyle(color: Colors.grey),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  controller.isCommentPosting.value
                                      ? const Center(
                                          child: Loading(),
                                        )
                                      : Card(
                                          margin: const EdgeInsets.all(10),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 5, 10),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: TextField(
                                                    controller: controller
                                                        .commentController,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'Write your comment'),
                                                  ),
                                                  trailing: TextButton(
                                                      onPressed: () {
                                                        controller.postComment(
                                                            Get.parameters[
                                                                'id']!);
                                                      },
                                                      child:
                                                          const Text('Send')),
                                                ),
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: controller.blog
                                                        .value.commentCount,
                                                    reverse: true,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Divider(
                                                            thickness: 1,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  controller
                                                                      .blog
                                                                      .value
                                                                      .comment![
                                                                          index]
                                                                      .user,
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                Text(
                                                                  convertToAgo(DateTime.parse(controller
                                                                      .blog
                                                                      .value
                                                                      .comment![
                                                                          index]
                                                                      .createdAt)),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          600],
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        15),
                                                            child: Text(
                                                              controller
                                                                  .blog
                                                                  .value
                                                                  .comment![
                                                                      index]
                                                                  .comment,
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                              ],
                                            ),
                                          ),
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
