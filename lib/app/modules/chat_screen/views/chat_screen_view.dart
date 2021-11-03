import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/chat_screen_controller.dart';
import 'widgets/message_bubble.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: controller.messages.length,
            itemBuilder: (context, index) {
              return MessageBubble(controller.messages[index]);
            },
          )),
          const Divider(
            thickness: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: controller.messageTextController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    hintText: 'Type your message here...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    // messageText = messageText.trim();
                    // if (messageText.isNotEmpty) {
                    //   setState(() {
                    //     messages.insert(
                    //         0,
                    //         Message(
                    //             text: messageText,
                    //             time: DateTime.now(),
                    //             isMe: true));
                    //   });
                    //   messageText = null;
                    //   messageTextController.clear();
                    // }
                  },
                  icon: const Icon(
                    Icons.send,
                    color: kGreenishBlue,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
