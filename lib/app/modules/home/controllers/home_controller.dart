import 'package:gces_social/app/data/models/routine.dart';
import 'package:gces_social/app/modules/announcements/views/announcements_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../blog_tab/views/blog_tab_view.dart';
import '../../home_tab/views/home_tab_view.dart';
// import '../../message_tab/views/message_tab_view.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  late final List<Widget> pages;
  final pageController = PageController(initialPage: 0, keepPage: true);
  late int today;
  ClassRoutine? classRoutine;

  List<Period>? todaysClasses;
  // Widget get currentPage => pages[selectedIndex.value];

  @override
  void onInit() {
    super.onInit();
    classRoutine = Get.arguments;
    int weekday = DateTime.now().weekday;
    today = weekday == 7 ? 0 : weekday;
    if (classRoutine != null) {
      todaysClasses = classRoutine!.day[today].period;
    }
    pages = [HomeTabView(todaysClasses), AnnouncementsView(), BlogTabView()];
  }

  void changeIndex(int index) {
    selectedIndex(index);
    update();
  }

  void updateRoutine(ClassRoutine? routine) {
    classRoutine = routine;
    if (classRoutine != null) {
      todaysClasses = classRoutine!.day[today].period;
    }
    update();
  }

  void goToAnnouncements() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    changeIndex(1);
  }
}
