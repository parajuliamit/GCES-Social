import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ColumnText extends StatelessWidget {
  final int count;
  final String title;
  final VoidCallback onPress;
  const ColumnText(
      {Key? key,
      required this.count,
      required this.title,
      required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress
      //Goto screen
      ,
      child: Column(
        children: [
          Text(
            '$count',
            style: kMediumText.copyWith(color: Colors.black),
          ),
          Text(
            title,
            style: kSmallText.copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
