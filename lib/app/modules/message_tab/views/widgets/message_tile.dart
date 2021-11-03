import 'package:flutter/material.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.currentTime,
  }) : super(key: key);

  final DateTime currentTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.CHAT_SCREEN);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  child: Icon(
                    Icons.account_circle,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ram Bahadur Pun',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'How effective is alternative way of learning?How effective is alternative way of learning?How effective is alternative way of learning?',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          Text(
                            '${currentTime.hour}:${currentTime.minute}',
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Divider(),
            )
          ],
        ),
      ),
    );
  }
}
