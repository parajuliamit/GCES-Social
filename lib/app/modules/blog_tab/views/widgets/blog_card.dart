import 'package:flutter/material.dart';
import 'package:gces_social/app/constants.dart';
import 'package:gces_social/app/data/models/blog/blog_response.dart';
import 'package:gces_social/app/modules/blog_tab/controllers/blog_tab_controller.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BlogCard extends StatelessWidget {
  final int index;
  const BlogCard(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogTabController>(builder: (controller) {
      var response = controller.blogs[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.VIEW_BLOG, parameters: {
              "id": response.id.toString(),
              "user": response.user,
              "time": response.createdAt
            });
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
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
                            response.user,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          Text(convertToAgo(DateTime.parse(response.createdAt)))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    response.title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Read More...',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          await controller.likeBlog(index);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              response.totalLikes.toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: response.liked
                                      ? Colors.blue
                                      : Colors.grey),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.thumb_up,
                              color: response.liked ? Colors.blue : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            response.commentCount.toString(),
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
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
