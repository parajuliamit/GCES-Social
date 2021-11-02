import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import '../api/login_api.dart';
import '../local/login_reponse.dart';

class AuthRepository {
  final SharedPreferences _sharedPreferences;
  final Dio _dio;

  AuthRepository(this._sharedPreferences, this._dio);

  Future<void> getLoginResponse(LoginRequest loginRequest) async {
    LoginResponse loginResponse;

    loginResponse = await LoginApi(_dio).login(loginRequest);

    LoginResponseCache(_sharedPreferences).set(loginResponse);
  }
}
