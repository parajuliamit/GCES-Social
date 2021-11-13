import 'package:flutter/material.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';

import '../controllers/routine_screen_controller.dart';

class RoutineScreenView extends GetView<RoutineScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Routine'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: Loading(),
              )
            : controller.routine == null || controller.isError.isTrue
                ? ErrorPage('Unable to load routine', controller.loadRoutine)
                : Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1,
                                    color: Colors.blueGrey.withOpacity(0.2)))),
                        padding: const EdgeInsets.only(top: 10),
                        // color: Colors.deepPurple.withOpacity(0.2),
                        width: 100,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.changeIndex(index);
                                },
                                child: Row(
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      height:
                                          (controller.selectedIndex == index)
                                              ? 50
                                              : 0,
                                      width: 5,
                                      color: Colors.deepPurple,
                                    ),
                                    Expanded(
                                        child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      alignment: Alignment.centerLeft,
                                      height: 50,
                                      color: (controller.selectedIndex == index)
                                          ? Colors.blueGrey.withOpacity(0.2)
                                          : Colors.transparent,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 5),
                                      child: Text(
                                        controller.routine!.day[index].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 5,
                              );
                            },
                            itemCount: controller.routine!.day.length),
                      ),
                      Expanded(
                          child: PageView(
                              onPageChanged: (index) {
                                controller.pageChange(index);
                              },
                              scrollDirection: Axis.vertical,
                              controller: controller.pageController,
                              children: controller.getList()))
                    ],
                  ),
      ),
    );
  }
}
