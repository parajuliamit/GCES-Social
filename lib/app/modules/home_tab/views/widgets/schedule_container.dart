import 'package:flutter/material.dart';

class ScheduleContainer extends StatelessWidget {
  const ScheduleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 1,
                offset: Offset(0, 2)),
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey[300]!)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            '6:00 AM - 7:00 AM',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Flexible(
            child: Text(
              'Principles of Programming Language',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Text('Hari Ram Sharma')
        ],
      ),
    );
  }
}
