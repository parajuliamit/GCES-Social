import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gces_social/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../app_repository.dart';

class RoutineScreenController extends GetxController {
  int weekDay = DateTime.now().weekday;
  final selectedIndex = 0.obs;

  final isLoading = false.obs;
  final isError = false.obs;
  var routine = Get.find<HomeController>().classRoutine;

  // final List<String> days = [
  //   'Sunday',
  //   'Monday',
  //   'Tuesday',
  //   'Wednesday',
  //   'Thursday',
  //   'Friday'
  // ];

  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    int index = weekDay == 6 || weekDay == 7 ? 0 : weekDay;
    pageController = PageController(initialPage: index);
    selectedIndex(index);
  }

  void loadRoutine() async {
    isError(false);
    isLoading(true);
    try {
      routine =
          await Get.find<AppRepository>().getRoutineRepository().getRoutine();
      Get.find<HomeController>().updateRoutine(routine);
    } catch (e) {
      print(e);
      isError(true);
    }
    isLoading(false);
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
    selectedIndex(index);
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    update();
  }

  void pageChange(int index) {
    selectedIndex(index);
    update();
  }

  List<Widget> getList() {
    List<Widget> classList = [];
    if (routine == null) return classList;
    classList = List.generate(
        6,
        (i) => routine!.day[i].period.isEmpty
            ? const Center(
                child: Text('No classes'),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: routine!.day[i].period.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    routine!.day[i].period[index].time
                                        .split('-')[0],
                                    // '6:00 AM',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  const Text('TO',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                  Text(
                                      routine!.day[i].period[index].time
                                          .split('-')[1],
                                      style: const TextStyle(
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
                                children: [
                                  Text(
                                    routine!.day[i].period[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    routine!.day[i].period[index].teacher,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }));
    return classList;
  }
}
