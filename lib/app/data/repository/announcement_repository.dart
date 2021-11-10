import 'package:dio/dio.dart';
import 'package:gces_social/app/app_controller.dart';
import 'package:gces_social/app/data/api/announcement/announcement_api.dart';
import 'package:get/get.dart';

import '../models/announcement.dart';

class AnnouncementRepository {
  final Dio _dio;

  AnnouncementRepository(this._dio);

  Future<List<Announcement>> getAnnouncements() async {
    return await AnnouncementApi(_dio)
        .getAnnouncements(Get.find<AppController>().batch);
  }
}
