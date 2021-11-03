import 'package:flutter/material.dart';
import 'package:gces_social/app/data/models/assignments.dart';

class AssignmentsTile extends StatelessWidget {
  final Assignments assignments;

  const AssignmentsTile({Key? key, required this.assignments})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                      color: assignments.status == 1
                          ? Colors.red
                          : assignments.status == 2
                              ? Colors.blue
                              : Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    assignments.status == 1
                        ? 'TODO'
                        : assignments.status == 2
                            ? 'PENDING'
                            : 'APPROVED',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  assignments.subject,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  assignments.title,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Deadline: ${assignments.deadline}',
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
