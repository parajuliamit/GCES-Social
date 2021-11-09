import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/routine.dart';

part 'routine_api.g.dart';

@RestApi()
abstract class RoutineApi {
  factory RoutineApi(Dio dio) = _RoutineApi;

  @GET("routine/{batch}")
  Future<List<Routine>> getRoutine(@Path("batch") String batch);
}
