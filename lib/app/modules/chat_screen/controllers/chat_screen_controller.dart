import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/widgets/message.dart';

class ChatScreenController extends GetxController {
  late String messageText;
  List<Message> messages = [
    Message(text: 'hello', isMe: true, time: DateTime.now()),
    Message(text: 'hello', isMe: true, time: DateTime.now()),
    Message(
        text: ' Anything else? How may I help you?',
        isMe: false,
        time: DateTime.now()),
    Message(text: 'hello,', isMe: true, time: DateTime.now()),
  ];

  final messageTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
