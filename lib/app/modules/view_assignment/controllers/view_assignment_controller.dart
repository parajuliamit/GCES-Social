import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:gces_social/app/app_repository.dart';
import 'package:gces_social/app/constants.dart';
import 'package:gces_social/app/data/models/assignment/view_assignment.dart';
import 'package:get/get.dart';

class ViewAssignmentController extends GetxController {
  ViewAssignment? assignment;
  final appRepo = Get.find<AppRepository>();
  final isLoading = false.obs;
  final isError = false.obs;
  late String assignmentId;
  late String assignmentStatus;
  @override
  void onInit() {
    super.onInit();
    assignmentId = Get.parameters['id']!;
    assignmentStatus = Get.parameters['status']!;
    loadAssignment();
  }

  void loadAssignment() async {
    isError(false);
    isLoading(true);
    try {
      assignment = await Get.find<AppRepository>()
          .getAssignmentRepository()
          .getAssignment(assignmentId);
    } catch (e) {
      print(e);
      isError(true);
    }
    isLoading(false);
  }

  void submitAssignment(File file) async {
    isLoading(true);
    String fileName = file.path.split('/').last;
    dio.FormData formData = dio.FormData.fromMap({
      "file": await dio.MultipartFile.fromFile(file.path, filename: fileName),
      "assignment": assignmentId
    });
    try {
      var response = await appRepo.dio
          .post("${baseUrl}assignment/submit/", data: formData);
      Get.back();
      Get.rawSnackbar(message: 'Success', duration: const Duration(seconds: 2));
    } catch (e) {
      print(e);
      Get.rawSnackbar(
          message: e.toString(), duration: const Duration(seconds: 3));
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
