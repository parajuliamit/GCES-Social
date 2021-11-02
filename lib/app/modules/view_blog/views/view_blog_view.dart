import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_blog_controller.dart';

class ViewBlogView extends GetView<ViewBlogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ViewBlogView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ViewBlogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
