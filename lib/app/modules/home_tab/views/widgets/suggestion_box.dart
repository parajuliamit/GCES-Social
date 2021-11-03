import 'package:flutter/material.dart';
import 'package:gces_social/app/modules/home_tab/controllers/home_tab_controller.dart';
import 'package:gces_social/app/widgets/widgets.dart';
import 'package:get/get.dart';

class SuggestionBox extends StatelessWidget {
  const SuggestionBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeTabController>();
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: Loading(),
            )
          : AlertDialog(
              title: const Text('What could be improved?'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                        controller: controller.suggestionController,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 8,
                        decoration: const InputDecoration(
                            hintText: 'Type your suggestion here',
                            border: OutlineInputBorder())),
                    Row(
                      children: [
                        Checkbox(
                            value: controller.isAnonymous.value,
                            onChanged: (value) {
                              controller.toggleAnonymous();
                            }),
                        const Text('Send as anonymous')
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      controller.postSuggestion();
                    },
                    child: const Text('Submit'))
              ],
            ),
    );
  }
}
