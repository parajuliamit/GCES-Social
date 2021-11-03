import 'package:flutter/material.dart';
import 'package:gces_social/app/constants.dart';
import 'package:gces_social/app/data/models/announcement.dart';
import 'package:get/get.dart';

import '../view_announcement.dart';

class AnnouncementTile extends StatelessWidget {
  final Announcement announcement;
  const AnnouncementTile(
    this.announcement, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ViewAnnouncement(announcement), transition: Transition.zoom);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: announcement.category == 'exam'
                          ? Colors.red
                          : announcement.category == 'events'
                              ? Colors.blue
                              : Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    announcement.category.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              announcement.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              convertToAgo(DateTime.parse(announcement.createdAt)),
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
