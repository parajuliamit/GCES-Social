import 'package:dio/dio.dart';
import 'package:gces_social/app/data/api/blog/blog_api.dart';
import 'package:gces_social/app/data/models/blog/blog_detail_response.dart';
import 'package:gces_social/app/data/models/blog/blog_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import '../api/auth/login_api.dart';
import '../local/login_reponse.dart';

class BlogRepository {
  final Dio _dio;

  BlogRepository(this._dio);

  Future<List<BlogResponse>> getBlogs() async {
    return await BlogApi(_dio).getBlogs();
  }

  Future<BlogDetailResponse> getBlogDetail(String id) async {
    return await BlogApi(_dio).getBlogDetail(id);
  }
}
