import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/assignment/assignment.dart';
import '../../models/assignment/view_assignment.dart';

part 'assignment_api.g.dart';

@RestApi()
abstract class AssignmentApi {
  factory AssignmentApi(Dio dio) = _AssignmentApi;

  @GET("assignment/{batch}/")
  Future<List<Assignment>> getAssignments(@Path("batch") String batch);

  @GET("assignment/view/{id}/")
  Future<ViewAssignment> getAssignment(@Path("id") String id);
}
