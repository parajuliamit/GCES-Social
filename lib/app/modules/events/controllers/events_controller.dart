import 'package:dio/dio.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/event.dart';
import 'package:get/get.dart';

import '../../../app_repository.dart';

class EventsController extends GetxController {
  final isLoading = false.obs;
  final events = <Event>[].obs;
  final errorMessage = 'Server Error'.obs;
  final isError = false.obs;
  final announcementRepo =
      Get.find<AppRepository>().getAnnouncementRepository();

  @override
  void onInit() {
    super.onInit();
    getEvents();
  }

  Future<void> getEvents() async {
    isLoading.toggle();
    isError(false);
    try {
      List<Event> response = await announcementRepo.getEvents();
      events.assignAll(response);
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
