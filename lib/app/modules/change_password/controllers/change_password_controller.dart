import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gces_social/app/app_repository.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/login/login_request.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class ChangePasswordController extends GetxController {
  late final TextEditingController oldController;
  late final TextEditingController newController;
  late final TextEditingController confirmController;

  final appRepo = Get.find<AppRepository>();

  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    oldController = TextEditingController();
    newController = TextEditingController();
    confirmController = TextEditingController();
  }

  void changePassword() async {
    if (newController.text.isEmpty ||
        oldController.text.isEmpty ||
        confirmController.text.isEmpty) {
      Get.rawSnackbar(
          message: 'All fields are required.',
          duration: const Duration(seconds: 3));
      return;
    }
    if (newController.text != confirmController.text) {
      Get.rawSnackbar(
          message: 'Confirm Password field is different.',
          duration: const Duration(seconds: 3));
      return;
    }
    isLoading(true);
    try {
      await appRepo.getAuthRepository().getLoginResponse(LoginRequest(
          username: 'amit@email.com', password: oldController.text));
      await appRepo.dio.put("users/change-password/",
          data: {"password": newController.text});
      Get.back();
      Get.rawSnackbar(
          message: "Password changed successfully.",
          duration: const Duration(seconds: 3));
    } catch (e) {
      if (e is DioError) {
        var errorCode = ServerError.withError(error: e).getErrorCode();
        if (errorCode == 401) {
          Get.rawSnackbar(
              message: 'Wrong old password.',
              duration: const Duration(seconds: 3));
        } else {
          Get.rawSnackbar(
              message: ServerError.withError(error: e).getErrorMessage(),
              duration: const Duration(seconds: 3));
        }
      } else {
        Get.rawSnackbar(
            message: e.toString(), duration: const Duration(seconds: 3));
      }
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
