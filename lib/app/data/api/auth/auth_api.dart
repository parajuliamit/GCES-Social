import 'package:dio/dio.dart';
import 'package:gces_social/app/data/models/register/register_request.dart';
import 'package:gces_social/app/data/models/register/verify_otp.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/login/login_request.dart';
import '../../models/login/login_response.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST("users/login/")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST("users/register/")
  Future<LoginResponse> register(@Body() RegisterRequest registerRequest);

  @POST("users/verify/")
  Future<void> verify(@Body() VerifyOtp verifyOtp);

  @GET("users/verify/resend/{id}/")
  Future<void> resendOtp(@Path("id") String id);
}
