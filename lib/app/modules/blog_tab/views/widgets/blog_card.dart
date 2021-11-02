import 'package:flutter/material.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BlogCard extends StatefulWidget {
  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool _like = false;
  int likesCount = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.VIEW_BLOG);
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
                      children: const [
                        Text(
                          'Amit',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        Text('time')
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'title',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
                      children: const [
                        Text(
                          '10',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
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
