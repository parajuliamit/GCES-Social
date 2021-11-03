import 'package:flutter/material.dart';

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
        body: GetBuilder<RoutineScreenController>(builder: (controller) {
          return Row(
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
                              duration: const Duration(milliseconds: 300),
                              height:
                                  (controller.selectedIndex == index) ? 50 : 0,
                              width: 5,
                              color: Colors.deepPurple,
                            ),
                            Expanded(
                                child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              color: (controller.selectedIndex == index)
                                  ? Colors.blueGrey.withOpacity(0.2)
                                  : Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              child: Text(
                                controller.days[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
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
                    itemCount: controller.days.length),
              ),
              Expanded(
                  child: PageView(
                      onPageChanged: (index) {
                        controller.pageChange(index);
                      },
                      scrollDirection: Axis.vertical,
                      controller: controller.pageController,
                      children: getList()))
            ],
          );
        }));
  }

  List<Widget> getList() {
    List<Widget> classList = [];
    for (int i = 1; i <= 6; i++) {
      classList.add(
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Text(
                                '6:00 AM',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text('TO',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                              Text('7:00 AM',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12))
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              thickness: 1,
                            )),
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                'Computer Network',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Dilip Kumar Shrestha',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    }
    return classList;
  }
}
