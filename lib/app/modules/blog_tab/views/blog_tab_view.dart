import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/blog_tab_controller.dart';
import 'widgets/blog_card.dart';

class BlogTabView extends GetView<BlogTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Blog'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kGreenishBlue,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return BlogCard();
                }),
          ),
        ));
  }
}
