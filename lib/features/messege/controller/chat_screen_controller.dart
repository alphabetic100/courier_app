import 'dart:developer';

import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/messege/controller/web_socket_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final WebSocketClient socketClient = WebSocketClient();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    socketClient.connect(AppUrls.connectSocket);
    socketClient.setOnMessageReceived((message) {
      log("Message received: $message");
    });
  }

  RxBool showAttuchIcon = true.obs;
  RxString selectedImage = "".obs;
  showSendbox() {
    if (textController.text.isEmpty) {
      showAttuchIcon.value = true;
    } else {
      showAttuchIcon.value = false;
    }
  }

  //Chat Function Starts from here

  // Create Chat room
  Future<void> createChatRoom({
    required String user1Id,
    required String user2Id,
  }) async {
    log('Creating chat room with user1: $user1Id and user2: $user2Id');
    socketClient.joinRoom(user1Id, user2Id);
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

  void sendMessage(String text, {String? imagePath}) {
    if (text.trim().isNotEmpty || imagePath != null) {
      final now = DateTime.now();
      final formattedTime =
          "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";

      messages.add({
        'isSent': true,
        'text': text.trim(),
        'time': formattedTime,
        'sentStatus': 'sent',
        'image': imagePath, // Store image if there is one
      });

      // Optionally, you can send the message and image to the server
      socketClient.sendMessage({
        'text': text.trim(),
        'image': imagePath,
        'time': formattedTime,
      });
    }
  }

  void updateMessageStatus(int index, String status) {
    if (index >= 0 && index < messages.length) {
      messages[index]['sentStatus'] = status;
      messages.refresh();
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image.path;
    }
  }
}
