import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/register/register_request.dart';
import 'package:gces_social/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../app_repository.dart';

class RegisterController extends GetxController {
  final showPassword = false.obs;
  final appRepo = Get.find<AppRepository>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void register() async {
    // Get.offAllNamed(Routes.HOME);
    // return;
    if (nameController.text.isEmpty) {
      Get.rawSnackbar(
          message: 'Name can\'t be empty.',
          duration: const Duration(seconds: 2));
      return;
    }
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
      RegisterRequest registerRequest = RegisterRequest(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text);

      var response =
          await appRepo.getAuthRepository().registerUser(registerRequest);

      Get.offAllNamed(Routes.VERIFY_SCREEN,
          parameters: {"id": response.id.toString(), "email": response.email});
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

  @override
  void onClose() {}

  void changeVisibility() {
    showPassword.toggle();
  }
}
