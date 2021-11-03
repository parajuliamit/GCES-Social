import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RoutineScreenController extends GetxController {
  int weekDay = DateTime.now().weekday;
  int selectedIndex = 0;

  final List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];

  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    selectedIndex = weekDay == 6 || weekDay == 7 ? 0 : weekDay;
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    update();
  }

  void pageChange(int index) {
    selectedIndex = index;
    update();
  }
}
