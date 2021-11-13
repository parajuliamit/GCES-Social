import 'package:dio/dio.dart';
import 'package:gces_social/app/data/models/register/register_request.dart';
import 'package:gces_social/app/data/models/register/verify_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import '../api/auth/auth_api.dart';
import '../local/login_reponse.dart';

class AuthRepository {
  final SharedPreferences _sharedPreferences;
  final Dio _dio;

  AuthRepository(this._sharedPreferences, this._dio);

  Future<void> getLoginResponse(LoginRequest loginRequest) async {
    LoginResponse loginResponse;

    loginResponse = await AuthApi(_dio).login(loginRequest);

    LoginResponseCache(_sharedPreferences).set(loginResponse);
  }

  void logout() {
    LoginResponseCache(_sharedPreferences).delete();
  }

  bool isLoggedIn() {
    if (_sharedPreferences.getString('loginResponseLocal') == null) {
      return false;
    }
    return _sharedPreferences.getString('loginResponseLocal')!.isNotEmpty;
  }

  Future<LoginResponse?> getCacheResponse() async {
    return await LoginResponseCache(this._sharedPreferences).get();
  }

  Future<LoginResponse> registerUser(RegisterRequest registerRequest) async {
    LoginResponse loginResponse;

    loginResponse = await AuthApi(_dio).register(registerRequest);

    LoginResponseCache(_sharedPreferences).set(loginResponse);
    return loginResponse;
  }

  Future<void> verifyOtp(VerifyOtp verifyOtp) async {
    await AuthApi(_dio).verify(verifyOtp);
  }

  Future<void> resendOtp(String userId) async {
    await AuthApi(_dio).resendOtp(userId);
  }
}
