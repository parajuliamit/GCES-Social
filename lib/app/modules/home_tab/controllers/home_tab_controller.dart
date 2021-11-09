import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gces_social/app/app_repository.dart';
import 'package:gces_social/app/data/exception/server_exception.dart';
import 'package:gces_social/app/data/models/suggestion.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  final isAnonymous = false.obs;
  final isLoading = false.obs;
  late final TextEditingController suggestionController;
  final appRepo = Get.find<AppRepository>();

  @override
  void onInit() {
    super.onInit();
    suggestionController = TextEditingController();
  }

  void postSuggestion() async {
    if (suggestionController.text.isEmpty) {
      Get.rawSnackbar(
          message: 'Suggestion can\'t be empty.',
          duration: const Duration(seconds: 3));
      return;
    }
    isLoading(true);
    try {
      Suggestion suggestion = Suggestion(
          isAnonymous: isAnonymous.value, content: suggestionController.text);

      await appRepo.getSuggestionRepository().postSuggestion(suggestion);
      isLoading(false);
      Get.back();
      Get.rawSnackbar(
          message: 'Your suggestion is recorded successfully.',
          duration: const Duration(seconds: 3));
      suggestionController.clear();
      isAnonymous(false);
      return;
    } catch (e) {
      print(e);
      String errorText;
      if (e is DioError) {
        errorText = ServerError.withError(error: e).getErrorMessage();
      } else {
        errorText = e.toString();
      }
      Get.rawSnackbar(message: errorText, duration: const Duration(seconds: 3));
    }
    isLoading(false);
  }

  void toggleAnonymous() => isAnonymous.toggle();

  @override
  void onClose() {
    suggestionController.dispose();
  }
}
