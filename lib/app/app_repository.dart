// ignore_for_file: unnecessary_this

import 'package:dio/dio.dart';
import 'package:gces_social/app/data/repository/blog_repository.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'data/interceptors/authentication_interceptor.dart';
import 'data/repository/announcement_repository.dart';
import 'data/repository/auth_repository.dart';

class AppRepository extends GetxService {
  final Dio _dioClient;
  final SharedPreferences _sharedPreferences;

  AppRepository(this._dioClient, this._sharedPreferences) {
    // Configure dio
    this._dioClient.options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 10 * 1000, // 10 seconds
        receiveTimeout: 20 * 1000, // 20 seconds
        validateStatus: (status) {
          return status! <= 500;
        });

    this
        ._dioClient
        .interceptors
        .add(AuthenticationInterceptor(_sharedPreferences));

    // For Debugging purpose
    this._dioClient.interceptors.add(PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        compact: true));
  }

  AuthRepository getAuthRepository() {
    return AuthRepository(_sharedPreferences, _dioClient);
  }

  BlogRepository getBlogRepository() {
    return BlogRepository(_dioClient);
  }

  AnnouncementRepository getAnnouncementRepository() {
    return AnnouncementRepository(_dioClient);
  }
}
