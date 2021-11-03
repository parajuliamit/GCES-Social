import 'package:flutter/material.dart';

class Categories {
  String title;
  IconData icon;
  Color color;
  VoidCallback onPress;

  Categories(
      {required this.onPress,
      required this.title,
      required this.icon,
      required this.color});
}
