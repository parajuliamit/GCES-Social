import 'package:flutter/material.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/write_blog_controller.dart';

class WriteBlogView extends GetView<WriteBlogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write a Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.titleController,
              textInputAction: TextInputAction.next,
              maxLength: 50,
              textAlign: TextAlign.left,
              onChanged: (value) {},
              decoration:
                  kBlogInputDecoration.copyWith(hintText: 'Your title here'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
                controller: controller.contentController,
                maxLines: 20,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.left,
                decoration: kBlogInputDecoration.copyWith(
                    hintText: 'Your article here')),
            const SizedBox(
              height: 24.0,
            ),
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: Loading(),
                    )
                  : CustomButton(
                      color: kGreenishBlue,
                      text: 'POST',
                      onPress: () async {
                        controller.postBlog();
                        // const snackBar = SnackBar(
                        //   content: Text(
                        //     'Your article is submitted for verification.',
                        //   ),
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // Get.back();
                      },
                      textColor: Colors.white,
                    ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
