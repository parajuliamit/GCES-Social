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
        elevation: 0,
        title: Text('Write a Blog'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              maxLength: 50,
              textAlign: TextAlign.left,
              onChanged: (value) {},
              decoration:
                  kBlogInputDecoration.copyWith(hintText: 'Your title here'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
                maxLines: 20,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                textAlign: TextAlign.left,
                onChanged: (value) {},
                decoration: kBlogInputDecoration.copyWith(
                    hintText: 'Your article here')),
            const SizedBox(
              height: 24.0,
            ),
            CustomButton(
              color: Colors.blue,
              text: 'POST',
              onPress: () {
                const snackBar = SnackBar(
                  content: Text(
                    'Your article is submitted for verification.',
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Get.back();
              },
              textColor: Colors.white,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
