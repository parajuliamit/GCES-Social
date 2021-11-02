import 'package:dio/dio.dart';
import 'package:gces_social/app/data/local/login_reponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationInterceptor extends Interceptor {
  final SharedPreferences _sharedPreferences;
  final bool isAuthenticated;

  AuthenticationInterceptor(this._sharedPreferences,
      {this.isAuthenticated = true});

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await LoginResponseCache(this._sharedPreferences).get();

    if (token == null) {
      return super.onRequest(options, handler);
    }
    print(token.access);

    if (token.token.isNotEmpty) {
      options.headers.addAll({"Authorization": "Bearer ${token.token}"});
    }
    return super.onRequest(options, handler);
  }

  // @override
  // Future onError(DioError err, ErrorInterceptorHandler handler) {
  //   if (err.response!.statusCode == 404) {
  //     print(err.toString());
  //   }
  //   print(err.toString());
  //   super.onError(err, handler);
  //   return Future.value(err);
  // }
}
