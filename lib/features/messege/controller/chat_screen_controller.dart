import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController textController = TextEditingController();

  RxBool showSnadBox = false.obs;
  showSendbox() {
    if (textController.text.isNotEmpty) {
      showSnadBox.value = true;
    } else {
      showSnadBox.value = false;
    }
  }

  var messages = <Map<String, dynamic>>[
    {
      'isSent': false,
      'text': 'Hi! Just wanted to say I love your profile!',
      'time': '10:30 AM',
      'sentStatus': 'delivered'
    },
    {
      'isSent': true,
      'text': 'Would be cool to meet up if our paths cross!',
      'time': '10:32 AM',
      'sentStatus': 'seen'
    },
    {
      'isSent': false,
      'text': 'That\'s a cool idea, let\'s meet tomorrow',
      'time': '10:35 AM',
      'sentStatus': 'delivered'
    },
  ].obs;

  void sendMessage(String text) {
    if (text.trim().isNotEmpty) {
      final now = DateTime.now();
      final formattedTime =
          "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";
      messages.add({
        'isSent': true,
        'text': text.trim(),
        'time': formattedTime,
        'sentStatus': 'sent'
      });
    }
  }

  void updateMessageStatus(int index, String status) {
    if (index >= 0 && index < messages.length) {
      messages[index]['sentStatus'] = status;
      messages.refresh();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
