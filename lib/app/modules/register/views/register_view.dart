import 'package:flutter/material.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/gcesblur.jpg'),
                  fit: BoxFit.fitHeight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Opacity(
                  opacity: 0.9,
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                    ),
                  ),
                ),
              ),
              //220
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? const Center(
                        child: Loading(),
                      )
                    : Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 40,
                            ),
                            title: TextField(
                              controller: controller.nameController,
                              textInputAction: TextInputAction.next,
                              maxLength: 50,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                              style: kInputTextStyle,
                              decoration: kInputDecoration.copyWith(
                                  hintText: 'FULL NAME'),
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.alternate_email,
                                color: kBackgroundColor.withOpacity(0.8),
                                size: 30,
                              ),
                            ),
                            title: TextField(
                              controller: controller.emailController,
                              textInputAction: TextInputAction.next,
                              maxLength: 30,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.left,
                              style: kInputTextStyle.copyWith(fontSize: 18),
                              decoration: kInputDecoration.copyWith(
                                  hintText: 'COLLEGE E-MAIL ID'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.lock,
                                color: kBackgroundColor.withOpacity(0.8),
                                size: 30,
                              ),
                            ),
                            title: Obx(
                              () => TextField(
                                  controller: controller.passwordController,
                                  textInputAction: TextInputAction.done,
                                  obscureText: controller.showPassword.isFalse,
                                  textAlign: TextAlign.left,
                                  style: kInputTextStyle,
                                  decoration: kInputDecoration.copyWith(
                                      suffixIcon: InkWell(
                                        onTap: controller.changeVisibility,
                                        child: Icon(
                                          controller.showPassword.isFalse
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.white,
                                        ),
                                      ),
                                      hintText: 'NEW PASSWORD')),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Hero(
                            tag: 'register',
                            child: Builder(
                              builder: (context) => CustomButton(
                                color: Colors.white,
                                text: 'REGISTER',
                                onPress: () {
                                  controller.register();
                                },
                                textColor: kBackgroundColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                              onTap: () {
                                Get.offNamed(Routes.LOGIN_SCREEN);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Already Registered?',
                                  style: kSmallText,
                                ),
                              )),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
