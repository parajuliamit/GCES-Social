import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/attendance_screen_controller.dart';

class AttendanceScreenView extends GetView<AttendanceScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AttendanceScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AttendanceScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
