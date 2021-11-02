import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/gcesblur.jpg'),
                fit: BoxFit.fitHeight)),
        alignment: Alignment.center,
        child: SpinKitPumpingHeart(
          duration: const Duration(seconds: 2),
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width * 0.6,
            );
          },
        ),
      ),
    );
  }
}
