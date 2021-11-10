import 'package:dio/dio.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/announcement.dart';
import 'package:get/get.dart';

import '../../../app_repository.dart';

class AnnouncementsController extends GetxController {
  final isLoading = false.obs;
  final all = <Announcement>[].obs;
  final exam = <Announcement>[].obs;
  final general = <Announcement>[].obs;
  final events = <Announcement>[].obs;
  final errorMessage = 'Server Error'.obs;
  final isError = false.obs;
  final announcementRepo =
      Get.find<AppRepository>().getAnnouncementRepository();

  @override
  void onInit() {
    super.onInit();
    getAnnouncements();
  }

  Future<void> getAnnouncements() async {
    isLoading.toggle();
    isError(false);
    try {
      List<Announcement> response =
          await announcementRepo.getAnnouncements('2017SE');
      List<Announcement> examResposne = [];
      List<Announcement> eventResposne = [];
      List<Announcement> generalResposne = [];

      for (Announcement announcement in response) {
        if (announcement.category == 'exam') {
          examResposne.add(announcement);
        } else if (announcement.category == 'events') {
          eventResposne.add(announcement);
        } else {
          generalResposne.add(announcement);
        }
      }
      all.assignAll(response);
      exam.assignAll(examResposne);
      general.assignAll(generalResposne);
      events.assignAll(eventResposne);

      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      isError(true);
      print(e);
      if (e is DioError) {
        errorMessage(ServerError.withError(error: e).getErrorMessage());
      } else {
        errorMessage(e.toString());
      }
    }
  }
}
