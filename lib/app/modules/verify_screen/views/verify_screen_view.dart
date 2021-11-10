import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gces_social/app/widgets/widgets.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/verify_screen_controller.dart';

class VerifyScreenView extends GetView<VerifyScreenController> {
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
                height: 30,
              ),
              Text(
                'Enter the OTP sent to: ${Get.parameters['email']}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    shadows: [BoxShadow(offset: Offset(2, 2))]),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => controller.isLoading.value
                    ? const Loading()
                    : Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(15)),
                            child: TextField(
                                controller: controller.pinController,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                decoration:
                                    InputDecoration(border: InputBorder.none)),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            color: Colors.white.withOpacity(0.5),
                            text: 'VERIFY',
                            onPress: controller.verify,
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                              onTap: () {
                                controller.resendPin();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'RESEND PIN',
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
