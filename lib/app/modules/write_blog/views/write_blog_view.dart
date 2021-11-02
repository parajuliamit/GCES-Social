import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/write_blog_controller.dart';

class WriteBlogView extends GetView<WriteBlogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WriteBlogView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WriteBlogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
