import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPress;
  final Color textColor;

  CustomButton(
      {this.color = Colors.transparent,
      required this.text,
      required this.onPress,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialButton(
      elevation: 0,
      splashColor: kBackgroundColor.withOpacity(0.7),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: const BorderSide(color: Colors.white, width: 2),
      ),
      child: Container(
          width: size.width * 3 / 5,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            text,
            style: kMediumText.copyWith(color: textColor),
            textAlign: TextAlign.center,
          )),
      onPressed: onPress,
    );
  }
}
