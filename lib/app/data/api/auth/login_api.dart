import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/login/login_request.dart';
import '../../models/login/login_response.dart';

part 'login_api.g.dart';

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio) = _LoginApi;

  @POST("users/login/")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
