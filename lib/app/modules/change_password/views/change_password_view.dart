import 'package:flutter/material.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';
import 'widgets/password_input.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
          backgroundColor: Colors.blue[800],
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? const Center(
                  child: Loading(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      children: [
                        PasswordInput(
                          label: 'Old Password',
                          controller: controller.oldController,
                        ),
                        PasswordInput(
                          label: 'New Password',
                          controller: controller.newController,
                        ),
                        PasswordInput(
                          label: 'Confirm Password',
                          controller: controller.confirmController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          color: Colors.blue.shade800,
                          textColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          onPressed: () {
                            controller.changePassword();
                          },
                          child: const Text('Change Password'),
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
