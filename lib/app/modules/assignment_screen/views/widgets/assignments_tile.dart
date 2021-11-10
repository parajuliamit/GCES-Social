import 'package:flutter/material.dart';
import 'package:gces_social/app/data/models/assignment/assignment.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AssignmentsTile extends StatelessWidget {
  final Assignment assignment;

  const AssignmentsTile({Key? key, required this.assignment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.VIEW_ASSIGNMENT, parameters: {
          "id": assignment.id.toString(),
          "status": assignment.status
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: assignment.status == 'APPROVED'
                          ? Colors.green
                          : assignment.status == 'PENDING'
                              ? Colors.blue
                              : Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    assignment.status,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  assignment.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  assignment.user,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Deadline: ${assignment.submissionDate}',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 14),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
