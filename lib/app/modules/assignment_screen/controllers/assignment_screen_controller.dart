import 'package:gces_social/app/app_repository.dart';
import 'package:gces_social/app/data/models/assignment/assignment.dart';
import 'package:get/get.dart';

class AssignmentScreenController extends GetxController {
  final appRepo = Get.find<AppRepository>();
  final isError = false.obs;
  final isLoading = false.obs;

  final allAssignments = <Assignment>[].obs;
  final todo = <Assignment>[].obs;
  final submitted = <Assignment>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAssignments();
  }

  void loadAssignments() async {
    isError(false);
    isLoading(true);
    try {
      var response = await Get.find<AppRepository>()
          .getAssignmentRepository()
          .getAssignments('2017SE');

      List<Assignment> todoResposne = [];
      List<Assignment> submittedResponse = [];

      for (Assignment assignment in response) {
        if (assignment.status == 'TODO' || assignment.status == 'REJECTED') {
          todoResposne.add(assignment);
        } else {
          submittedResponse.add(assignment);
        }
      }
      allAssignments.assignAll(response);
      todo.assignAll(todoResposne);
      submitted.assignAll(submittedResponse);
    } catch (e) {
      print(e);
      isError(true);
    }
    isLoading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
