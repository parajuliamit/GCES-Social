import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gces_social/app/app_repository.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/models/login/login_request.dart';

class LoginScreenController extends GetxController {
  final appRepo = Get.find<AppRepository>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final isLoading = false.obs;

  void login() async {
    // Get.offAllNamed(Routes.HOME);
    // return;
    // if (!GetUtils.isEmail(emailController.text)) {
    if (emailController.text.isEmpty) {
      Get.rawSnackbar(
          message: 'Enter a valid email.',
          duration: const Duration(seconds: 2));
      return;
    }
    if (passwordController.text.isEmpty) {
      Get.rawSnackbar(
          message: 'Password can\'t be empty.',
          duration: const Duration(seconds: 2));
      return;
    }
    isLoading(true);
    try {
      LoginRequest loginRequest = LoginRequest(
          username: emailController.text, password: passwordController.text);

      await appRepo.getAuthRepository().getLoginResponse(loginRequest);

      var routine;
      try {
        routine = await appRepo.getRoutineRepository().getRoutine('2017SE');
      } catch (e) {
        print(e);
      }
      Get.offAllNamed(Routes.HOME, arguments: routine);
      isLoading(false);
      return;
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
}
