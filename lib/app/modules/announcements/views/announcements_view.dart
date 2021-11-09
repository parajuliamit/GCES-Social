import 'package:flutter/material.dart';
import 'package:gces_social/app/data/models/announcement.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';

import '../controllers/announcements_controller.dart';
import 'widgets/announcement_tile.dart';

class AnnouncementsView extends GetView<AnnouncementsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        // backgroundColor: Colors.lightGreen,
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  // indicator: BoxDecoration(color: Colors.black),
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  // isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text('ALL'),
                    ),
                    Tab(
                      child: Text('GENERAL'),
                    ),
                    Tab(
                      child: Text('EXAM'),
                    ),
                    Tab(
                      child: Text('EVENTS'),
                    )
                  ]),
            ),
            Obx(
              () => Expanded(
                child: controller.isLoading.value
                    ? const Center(child: Loading())
                    : controller.isError.value
                        ? ErrorPage(controller.errorMessage.value,
                            controller.getAnnouncements)
                        : TabBarView(children: [
                            RefreshIndicator(
                              onRefresh: () async {
                                controller.getAnnouncements();
                              },
                              child: ListView.builder(
                                  itemCount: controller.all.length,
                                  itemBuilder: (context, index) {
                                    return AnnouncementTile(
                                        controller.all[index]);
                                  }),
                            ),
                            RefreshIndicator(
                              onRefresh: () async {
                                controller.getAnnouncements();
                              },
                              child: ListView.builder(
                                  itemCount: controller.general.length,
                                  itemBuilder: (context, index) {
                                    return AnnouncementTile(
                                        controller.general[index]);
                                  }),
                            ),
                            RefreshIndicator(
                              onRefresh: () async {
                                controller.getAnnouncements();
                              },
                              child: ListView.builder(
                                  itemCount: controller.exam.length,
                                  itemBuilder: (context, index) {
                                    return AnnouncementTile(
                                        controller.exam[index]);
                                  }),
                            ),
                            RefreshIndicator(
                              onRefresh: () async {
                                controller.getAnnouncements();
                              },
                              child: ListView.builder(
                                  itemCount: controller.events.length,
                                  itemBuilder: (context, index) {
                                    return AnnouncementTile(
                                        controller.events[index]);
                                  }),
                            ),
                          ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
