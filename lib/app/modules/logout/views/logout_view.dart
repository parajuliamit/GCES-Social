import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/widgets.dart';
import '../controllers/logout_controller.dart';

class LogoutView extends GetView<LogoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/gcesblur.jpg'),
                fit: BoxFit.fitHeight)),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset('assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.75),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                const Text(
                  'GET CLOSER TO GCES FAMILY !',
                  style: kSmallText,
                ),
                const SizedBox(
                  height: 40,
                ),
                Hero(
                  tag: 'login',
                  child: CustomButton(
                    text: 'LOGIN',
                    onPress: () {
                      Get.toNamed(Routes.LOGIN_SCREEN);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: 'register',
                  child: CustomButton(
                    color: Colors.white,
                    text: 'REGISTER',
                    onPress: () {},
                    textColor: kBackgroundColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
