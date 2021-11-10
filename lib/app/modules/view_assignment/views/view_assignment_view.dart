import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gces_social/app/constants.dart';
import 'package:gces_social/app/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/view_assignment_controller.dart';

class ViewAssignmentView extends GetView<ViewAssignmentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment'),
        backgroundColor: Colors.red[800],
      ),
      body: Obx(() => controller.isLoading.isTrue
          ? const Center(
              child: Loading(),
            )
          : controller.isError.isTrue || controller.assignment == null
              ? ErrorPage(
                  'Unable to load assignment.', controller.loadAssignment)
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.assignment!.user,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '- ' +
                                      convertToAgo(DateTime.parse(
                                          controller.assignment!.createdAt)),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.assignment!.description,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                controller.assignment!.file == null
                                    ? const SizedBox()
                                    : Row(
                                        children: [
                                          const Text('Attachment:'),
                                          TextButton(
                                            onPressed: () {
                                              launch(
                                                  controller.assignment!.file!);
                                            },
                                            child: Row(
                                              children: const [
                                                Icon(Icons.insert_drive_file),
                                                Text(' Go to Drive')
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: ElevatedButton(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: const [
                                Icon(Icons.upload),
                                Text(' Upload')
                              ],
                            ),
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();

                              if (result != null) {
                                File file = File(result.files.single.path!);
                                controller.submitAssignment(file);
                              } else {
                                // User canceled the picker
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'My Submissions :',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        controller.assignment!.submissions.isEmpty
                            ? Card(
                                child: Container(
                                    padding: const EdgeInsets.all(20),
                                    width: double.infinity,
                                    child: const Text(
                                        'You have no submissions currently')),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    controller.assignment!.submissions.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: ListTile(
                                        leading: const Icon(Icons.file_copy),
                                        title: Text(
                                          controller.assignment!
                                              .submissions[index].file!
                                              .split('/')
                                              .last,
                                        ),
                                        trailing: Text(controller
                                                    .assignment!
                                                    .submissions[index]
                                                    .isApproved ==
                                                null
                                            ? 'Pending'
                                            : controller
                                                    .assignment!
                                                    .submissions[index]
                                                    .isApproved!
                                                ? 'Approved'
                                                : 'Rejected'),
                                      ),
                                    ),
                                  );
                                })
                      ],
                    ),
                  ),
                )),
    );
  }
}
