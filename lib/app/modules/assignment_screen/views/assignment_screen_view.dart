import 'package:flutter/material.dart';
import 'package:gces_social/app/data/models/assignments.dart';

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
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return AssignmentsTile(
                        assignments: Assignments(
                            title: 'Chapter 3-4 solve questions',
                            subject: 'System Programming',
                            deadline: currentTime,
                            status: 1,
                            details: 'COmplete your job asap'),
                      );
                    }),
                ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return AssignmentsTile(
                        assignments: Assignments(
                            title: 'Chapter 3-4 solve questions',
                            subject: 'System Programming',
                            deadline: DateTime.now(),
                            status: 1,
                            details: 'COmplete your job asap'),
                      );
                    }),
                ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return AssignmentsTile(
                        assignments: Assignments(
                            title: 'Chapter 3-4 solve questions',
                            subject: 'System Programming',
                            deadline: DateTime.now(),
                            status: 3,
                            details: 'Complete your job asap'),
                      );
                    }),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
