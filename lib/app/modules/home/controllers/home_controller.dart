import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../blog_tab/views/blog_tab_view.dart';
import '../../home_tab/views/home_tab_view.dart';
import '../../message_tab/views/message_tab_view.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  List<Widget> pages = [HomeTabView(), MessageTabView(), BlogTabView()];
  final pageController = PageController(initialPage: 0, keepPage: true);

  // Widget get currentPage => pages[selectedIndex.value];

  void changeIndex(int index) {
    selectedIndex(index);
    update();
  }

  void goToMessage() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    changeIndex(1);
  }
}
