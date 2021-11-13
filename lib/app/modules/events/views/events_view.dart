import 'package:flutter/material.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/events_controller.dart';

class EventsView extends GetView<EventsController> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Obx(() => controller.isLoading.isTrue
          ? const Center(
              child: Loading(),
            )
          : controller.isError.isTrue
              ? ErrorPage(controller.errorMessage.value, controller.getEvents)
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                      itemCount: controller.events.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 3, left: 5),
                              child: Text(
                                DateFormat('MMM d, yyyy').format(dateFormat
                                    .parse(controller.events[index].date)),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Card(
                                child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      controller.events[index].title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ))),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }),
                )),
    );
  }
}
