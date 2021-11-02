import 'package:flutter/material.dart';
import 'package:gces_social/app/constants.dart';
import 'package:gces_social/app/data/models/blog/blog_response.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BlogCard extends StatefulWidget {
  final BlogResponse response;

  const BlogCard(
    this.response, {
    Key? key,
  }) : super(key: key);
  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool _like = false;
  late int likesCount;

  @override
  void initState() {
    likesCount = widget.response.likes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.VIEW_BLOG, parameters: {
            "id": widget.response.id.toString(),
            "user": widget.response.user,
            "time": widget.response.createdAt
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
                          widget.response.user,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        Text(convertToAgo(
                            DateTime.parse(widget.response.createdAt)))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.response.title,
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
                      onTap: () {
                        setState(() {
                          _like = !_like;
                          _like ? likesCount++ : likesCount--;
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '$likesCount',
                            style: TextStyle(
                                fontSize: 15,
                                color: _like ? Colors.blue : Colors.grey),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.thumb_up,
                            color: _like ? Colors.blue : Colors.grey,
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
                          widget.response.commentCount.toString(),
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
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
  }
}
