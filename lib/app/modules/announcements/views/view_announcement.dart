import 'package:flutter/material.dart';
import 'package:gces_social/app/constants.dart';
import 'package:gces_social/app/data/models/announcement.dart';

class ViewAnnouncement extends StatelessWidget {
  final Announcement announcement;

  const ViewAnnouncement(
    this.announcement, {
    Key? key,
  }) : super(key: key);

  List<Widget> images() {
    List<Widget> images = [];
    if (announcement.image != null) {
      if (announcement.image!.isNotEmpty) {
        images.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading_gif.gif',
            image: '$imageBaseUrl${announcement.image!}',
          ),
        ));
      }
    }

    // for (String image in announcement.images) {
    //   images.add(Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Image.network(
    //       image,
    //       fit: BoxFit.fitWidth,
    //     ),
    //   ));
    // }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Announcements'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
              child: Container(
                color: Colors.lightGreen.withOpacity(0.2),
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      announcement.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'From: ${announcement.user}',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      convertToAgo(DateTime.parse(announcement.createdAt)),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                color: Colors.lightGreen.withOpacity(0.2),
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  announcement.content,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Column(
              children: images(),
            )
          ],
        ),
      ),
    );
  }
}
