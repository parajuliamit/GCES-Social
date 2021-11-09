import 'package:flutter/material.dart';
import 'package:gces_social/app/data/models/routine.dart';

class ScheduleContainer extends StatelessWidget {
  final Period period;
  const ScheduleContainer(
    this.period, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 1,
                offset: const Offset(0, 2)),
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey[300]!)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            period.time,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Flexible(
            child: Text(
              period.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Text(period.teacher)
        ],
      ),
    );
  }
}
