import 'package:flutter/material.dart';
import 'package:gces_social/app/data/models/categories.dart';
import 'package:gces_social/app/data/models/routine.dart';
import 'package:gces_social/app/modules/home_tab/views/widgets/quotes.dart';
import 'package:gces_social/app/modules/home_tab/views/widgets/suggestion_box.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'widgets/widgets.dart';
import '../controllers/home_tab_controller.dart';

class HomeTabView extends GetView<HomeTabController> {
  final List<Period>? todaysClasses;

  HomeTabView(this.todaysClasses);
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
          // const SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Today\'s Inspiration :',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Quotes()
              ],
            ),
          ),
          // const CountBar(),
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
            child: todaysClasses == null
                ? Container(
                    height: 120,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: const Center(child: Text('Unable to load classes.')),
                  )
                : todaysClasses!.isEmpty
                    ? Container(
                        height: 120,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child:
                            const Center(child: Text('No classes for today.')),
                      )
                    : ListView.builder(
                        itemCount: todaysClasses!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ScheduleContainer(todaysClasses![index]);
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
    // Categories(
    //     icon: Icons.announcement,
    //     title: 'Announcements',
    //     color: Colors.lightGreen,
    //     onPress: () {
    //       Get.toNamed(Routes.ANNOUNCEMENTS);
    //     }),
    Categories(
        icon: Icons.schedule,
        title: 'Class Routine',
        color: Colors.deepPurple,
        onPress: () {
          Get.toNamed(Routes.ROUTINE_SCREEN);
        }),
    Categories(
        icon: Icons.menu_book,
        title: 'Assignments',
        color: Colors.red[800]!,
        onPress: () {
          Get.toNamed(Routes.ASSIGNMENT_SCREEN);
        }),

    Categories(
        icon: Icons.date_range,
        title: 'Events',
        color: Colors.blue,
        onPress: () {
          Get.toNamed(Routes.EVENTS);
        }),
    Categories(
      icon: Icons.question_answer_outlined,
      title: 'Suggestion Box',
      color: Colors.lightGreen,
      onPress: () {
        showDialog(
            context: Get.context!,
            builder: (context) {
              return const SuggestionBox();
            });
      },
    ),
  ];
}
