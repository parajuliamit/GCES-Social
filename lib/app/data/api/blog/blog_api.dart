import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/blog/blog_response.dart';
import '../../models/blog/blog_detail_response.dart';

part 'blog_api.g.dart';

@RestApi()
abstract class BlogApi {
  factory BlogApi(Dio dio) = _BlogApi;

  @GET("blogs/")
  Future<List<BlogResponse>> getBlogs();

  @GET("/blogs/{blogId}/")
  Future<BlogDetailResponse> getBlogDetail(@Path("blogId") String blogId);
}
