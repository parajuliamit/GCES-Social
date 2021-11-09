import 'package:dio/dio.dart';

import '../api/routine/routine_api.dart';
import '../models/routine.dart';

class RoutineRepository {
  final Dio _dio;

  RoutineRepository(this._dio);

  Future<ClassRoutine> getRoutine(String batch) async {
    var routine = await RoutineApi(_dio).getRoutine(batch);
    return ClassRoutine(routine);
  }
}
