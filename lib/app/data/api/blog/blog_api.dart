import 'package:dio/dio.dart';
import 'package:gces_social/app/data/models/blog/comment_request.dart';
import 'package:gces_social/app/data/models/blog/write_blog_request.dart';
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

  @POST("blogs/create/")
  Future<BlogDetailResponse> writeBlog(
      @Body() WriteBlogRequest writeBlogRequest);

  @POST("blogs/comment/")
  Future<dynamic> postComment(@Body() CommentRequest commentRequest);
}
