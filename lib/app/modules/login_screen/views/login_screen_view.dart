import 'package:flutter/material.dart';
import 'package:gces_social/app/widgets/loading.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';
import '../controllers/login_screen_controller.dart';
import '../../../widgets/widgets.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 220,
                ),
              ),
              //220
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => controller.isLoading.value
                    ? const Loading()
                    : Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 40,
                            ),
                            title: TextField(
                              controller: controller.emailController,
                              textInputAction: TextInputAction.next,
                              maxLength: 30,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.left,
                              style: kInputTextStyle.copyWith(fontSize: 18),
                              decoration: kInputDecoration.copyWith(
                                  hintText: 'E-MAIL ID'),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
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
                            title: TextField(
                                controller: controller.passwordController,
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                textAlign: TextAlign.left,
                                style: kInputTextStyle,
                                onChanged: (value) {},
                                decoration: kInputDecoration.copyWith(
                                    hintText: 'PASSWORD')),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Forgot Password?',
                                  style: kSmallText,
                                ),
                              ),
                            ),
                          ),
                          Hero(
                            tag: 'login',
                            child: CustomButton(
                              color: Colors.white.withOpacity(0.5),
                              text: 'LOGIN',
                              onPress: controller.login,
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Not Registered?',
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
