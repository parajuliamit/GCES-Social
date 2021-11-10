import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../api/routine/routine_api.dart';
import '../models/routine.dart';

class RoutineRepository {
  final Dio _dio;

  RoutineRepository(this._dio);

  Future<ClassRoutine> getRoutine() async {
    var routine =
        await RoutineApi(_dio).getRoutine(Get.find<AppController>().batch);
    return ClassRoutine(routine);
  }
}
