import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/announcement.dart';

part 'announcement_api.g.dart';

@RestApi()
abstract class AnnouncementApi {
  factory AnnouncementApi(Dio dio) = _AnnouncementApi;

  @GET("/announcements/")
  Future<List<Announcement>> getAnnouncements();
}