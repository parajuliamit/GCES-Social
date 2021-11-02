import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/message_tab_controller.dart';
import 'widgets/message_tile.dart';

class MessageTabView extends GetView<MessageTabController> {
  DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                size: 30,
              ),
            )
          ],
          title: const Text('Messages'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return MessageTile(currentTime: currentTime);
              }),
        ));
  }
}
