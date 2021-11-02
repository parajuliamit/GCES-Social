import 'package:flutter/material.dart';

import '../../../../constants.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPress;
  IconText({required this.text, required this.icon, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blue[800],
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: kDrawerTitleText,
            )
          ],
        ),
      ),
    );
  }
}
