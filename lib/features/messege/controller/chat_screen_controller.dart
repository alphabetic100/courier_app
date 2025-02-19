import 'dart:convert';
import 'dart:developer';

import 'package:courierapp/core/services/Auth_service.dart';
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
      log("Raw WebSocket Message Received: $message");
      _handleIncomingMessage(message);
    });
  }

  var messages = <Map<String, dynamic>>[].obs;
  RxBool showAttuchIcon = true.obs;
  RxString selectedImage = "".obs;
  RxString roomId = "".obs;
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
    required String user2Id,
  }) async {
    final id = AuthService.userId.toString();
    socketClient.joinRoom(id, user2Id);
  }

  //Send message
  Future<void> sendMessage(
      {required String message,
      required String reciverId,
      String? image}) async {
    try {
      final Map<String, dynamic> messageBody = {
        "type": "sendMessage",
        "chatroomId": roomId.value,
        "senderId": AuthService.userId,
        "receiverId": reciverId,
        "content": message,
        "image": [],
      };

      socketClient.sendMessage(messageBody);
    } catch (e) {
      log("Seomething went wrong, error: $e");
    }
  }

  //Revice message
  void reciveMessage() {
    String id = AuthService.userId.toString();
    socketClient.viewMessage(roomId.value, id);
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

  void _handleIncomingMessage(String rawMessage) {
    final decodedMessage = jsonDecode(rawMessage);

    if (decodedMessage['type'] == 'loadMessages') {
      final conversation = decodedMessage['conversation'];
      if (conversation != null && conversation['id'] != null) {
        roomId.value = conversation['id'];
        messages.clear();
        for (var msg in conversation['messages']) {
          _addMessage(
            msg['id'],
            msg['content'],
            msg['senderId'],
            msg['conversationId'],
            msg['isRead'],
            msg['updatedAt'],
            msg['image'] ?? [],
          );
        }
      }
    } else if (decodedMessage['type'] == 'receiveMessage' ||
        decodedMessage['type'] == 'messageSent') {
      final message = decodedMessage['message'];
      if (message != null) {
        _addMessage(
          message['id'],
          message['content'],
          message['senderId'],
          message['conversationId'],
          message['isRead'],
          message['updatedAt'],
          message['image'] ?? [], // Handle images properly
        );
      }
    }
  }

  void _addMessage(
    String messageId,
    String content,
    String senderId,
    String conversationId,
    bool isRead,
    String updatedAt,
    List<dynamic> imageUrls, // Accept list of images
  ) {
    if (!messages.any((msg) => msg['id'] == messageId)) {
      messages.add({
        'id': messageId,
        'content': content,
        'senderId': senderId,
        'conversationId': conversationId,
        'isRead': isRead,
        'updatedAt': updatedAt,
        'image': imageUrls, // Store images
      });
      debugPrint(
          "Added message: $content from $senderId with images: $imageUrls");
    } else {
      debugPrint("Duplicate message ignored: $content from $senderId");
    }
  }
}
