import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gces_social/app/app_repository.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/register/verify_otp.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerifyScreenController extends GetxController {
  final isLoading = false.obs;
  final appRepo = Get.find<AppRepository>();
  late final TextEditingController pinController;

  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();
  }

  void verify() async {
    // Get.offAllNamed(Routes.HOME);
    // return;
    if (pinController.text.length != 6) {
      Get.rawSnackbar(
          message: 'Enter valid OTP.', duration: const Duration(seconds: 2));
      return;
    }
    isLoading(true);
    try {
      VerifyOtp request =
          VerifyOtp(otp: pinController.text, user: Get.parameters['id'] ?? '1');

      await appRepo.getAuthRepository().verifyOtp(request);
      var routine;
      try {
        routine = await appRepo.getRoutineRepository().getRoutine();
      } catch (e) {
        print(e);
      }
      Get.offAllNamed(Routes.HOME, arguments: routine);
      isLoading(false);
    } catch (e) {
      print(e);
      String errorText;
      if (e is DioError) {
        errorText = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorText = e.toString();
      }
      Get.rawSnackbar(message: errorText, duration: const Duration(seconds: 3));
    }
    isLoading(false);
  }

  void resendPin() async {
    isLoading(true);
    try {
      await appRepo.getAuthRepository().resendOtp(Get.parameters['id'] ?? '1');
      Get.rawSnackbar(
          message: 'OTP sent successfully.',
          duration: const Duration(seconds: 2));
    } catch (e) {
      print(e);
      String errorText;
      if (e is DioError) {
        errorText = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorText = e.toString();
      }
      Get.rawSnackbar(message: errorText, duration: const Duration(seconds: 3));
    }
    isLoading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
