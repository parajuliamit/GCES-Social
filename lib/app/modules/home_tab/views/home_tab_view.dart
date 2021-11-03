import 'package:flutter/material.dart';
import 'package:gces_social/app/data/models/categories.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import 'widgets/widgets.dart';
import '../controllers/home_tab_controller.dart';

class HomeTabView extends GetView<HomeTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GCES Social'),
      ),
      drawer: const HomeDrawer(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 10,
          ),
          const CountBar(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Today\'s Classes',
              style: kSmallText.copyWith(color: Colors.grey, fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              DateFormat('EEE, MMM d, yyyy').format(DateTime.now()),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const ScheduleContainer();
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(categories.length, (index) {
                return ItemTile(
                  categories: categories[index],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  final List<Categories> categories = [
    Categories(
        icon: Icons.announcement,
        title: 'Announcements',
        color: Colors.lightGreen,
        onPress: () {
          Get.toNamed(Routes.ANNOUNCEMENTS);
        }),
    Categories(
        icon: Icons.menu_book,
        title: 'Assignments',
        color: Colors.red[800]!,
        onPress: () {}),
    Categories(
        icon: Icons.schedule,
        title: 'Class Routine',
        color: Colors.deepPurple,
        onPress: () {
          Get.toNamed(Routes.ROUTINE_SCREEN);
        }),
    Categories(
        icon: Icons.fact_check_outlined,
        title: 'Attendance',
        color: Colors.blue,
        onPress: () {}),
  ];
}
