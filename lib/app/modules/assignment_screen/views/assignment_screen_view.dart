import 'package:flutter/material.dart';
import 'package:gces_social/app/data/models/assignment/assignment.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';

import '../controllers/assignment_screen_controller.dart';
import 'widgets/assignments_tile.dart';

class AssignmentScreenView extends GetView<AssignmentScreenController> {
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: const Text('Assignments'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  // indicator: BoxDecoration(color: Colors.black),
                  indicatorColor: Colors.red[800],
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  // isScrollable: true,
                  tabs: const [
                    Tab(
                      child: Text('ALL'),
                    ),
                    Tab(
                      child: Text('TODO'),
                    ),
                    Tab(
                      child: Text('SUBMITTED'),
                    ),
                  ]),
            ),
            Obx(
              () => Expanded(
                child: controller.isLoading.isTrue
                    ? const Center(
                        child: Loading(),
                      )
                    : controller.isError.isTrue
                        ? ErrorPage('Unable to load assignments.',
                            controller.loadAssignments)
                        : controller.allAssignments.isEmpty
                            ? const Center(
                                child:
                                    Text('There are no assignments for you.'),
                              )
                            : TabBarView(children: [
                                ListView.builder(
                                    itemCount: controller.allAssignments.length,
                                    itemBuilder: (context, index) {
                                      return AssignmentsTile(
                                          assignment:
                                              controller.allAssignments[index]);
                                    }),
                                ListView.builder(
                                    itemCount: controller.todo.length,
                                    itemBuilder: (context, index) {
                                      return AssignmentsTile(
                                          assignment: controller.todo[index]);
                                    }),
                                ListView.builder(
                                    itemCount: controller.submitted.length,
                                    itemBuilder: (context, index) {
                                      return AssignmentsTile(
                                          assignment:
                                              controller.submitted[index]);
                                    }),
                              ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
