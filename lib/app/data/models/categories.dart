import 'package:flutter/material.dart';

class Categories {
  String title;
  IconData icon;
  Color color;
  Widget? screen;

  Categories(
      {this.screen,
      required this.title,
      required this.icon,
      required this.color});
}
