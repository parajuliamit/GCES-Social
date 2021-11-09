import 'package:flutter/material.dart';
import 'package:gces_social/app/constants.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kGreenishBlue,
          currentIndex: _.selectedIndex.value,
          onTap: (index) {
            _.pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
            _.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: 'Notices',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.mark_chat_unread_rounded),
            //   label: 'Message',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Blog',
            )
          ],
        ),
        body: PageView(
            onPageChanged: (index) {
              _.changeIndex(index);
            },
            controller: _.pageController,
            children: _.pages),
      );
    });
  }
}
