import 'package:dio/dio.dart';
import 'package:gces_social/app/data/models/event.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/announcement.dart';

part 'announcement_api.g.dart';

@RestApi()
abstract class AnnouncementApi {
  factory AnnouncementApi(Dio dio) = _AnnouncementApi;

  @GET("announcements/{batch}/")
  Future<List<Announcement>> getAnnouncements(@Path("batch") String batch);

  @GET("events/{batch}/")
  Future<List<Event>> getEvents(@Path("batch") String batch);
}
