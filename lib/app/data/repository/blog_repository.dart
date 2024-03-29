import 'package:dio/dio.dart';
import 'package:gces_social/app/data/api/blog/blog_api.dart';
import 'package:gces_social/app/data/models/blog/blog_detail_response.dart';
import 'package:gces_social/app/data/models/blog/blog_response.dart';
import 'package:gces_social/app/data/models/blog/comment_request.dart';
import 'package:gces_social/app/data/models/blog/write_blog_request.dart';

class BlogRepository {
  final Dio _dio;

  BlogRepository(this._dio);

  Future<List<BlogResponse>> getBlogs() async {
    return await BlogApi(_dio).getBlogs();
  }

  Future<BlogDetailResponse> getBlogDetail(String id) async {
    return await BlogApi(_dio).getBlogDetail(id);
  }

  Future<BlogDetailResponse> writeBlog(
      WriteBlogRequest writeBlogRequest) async {
    return await BlogApi(_dio).writeBlog(writeBlogRequest);
  }

  Future<dynamic> postComment(CommentRequest commentRequest) async {
    return await BlogApi(_dio).postComment(commentRequest);
  }

  Future<void> likeBlog(String blogId) async {
    await BlogApi(_dio).likeBlog(blogId);
  }
}
