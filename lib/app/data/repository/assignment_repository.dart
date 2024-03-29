import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../models/assignment/view_assignment.dart';
import '../api/assignment/assignment_api.dart';
import '../models/assignment/assignment.dart';

class AssignmentRepository {
  final Dio _dio;

  AssignmentRepository(this._dio);

  Future<List<Assignment>> getAssignments() async {
    return await AssignmentApi(_dio)
        .getAssignments(Get.find<AppController>().batch);
  }

  Future<ViewAssignment> getAssignment(String id) async {
    return await AssignmentApi(_dio).getAssignment(id);
  }
}
