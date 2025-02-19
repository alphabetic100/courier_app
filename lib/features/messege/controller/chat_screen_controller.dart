import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/messege/controller/web_socket_client.dart';
import 'package:dio/dio.dart';
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
  RxString generatedImageLink = "".obs;
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

  Future<void> sendMessage({
    required String message,
    required String reciverId,
    String? image,
  }) async {
    // Prevent sending empty messages with no image
    if (message.isEmpty && (image == null || image.isEmpty)) {
      return;
    }

    try {
      final Map<String, dynamic> messageBody = {
        "type": "sendMessage",
        "chatroomId": roomId.value,
        "senderId": AuthService.userId,
        "receiverId": reciverId,
        "content": message,
        "image": (image != null && image.isNotEmpty) ? [image] : [],
      };

      socketClient.sendMessage(messageBody);
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  //message status change
  void viewMessage() {
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

  // Generate image link
  Future<void> generateImageLink() async {
    final Dio dioClient = Dio();
    dioClient.options = BaseOptions(
      connectTimeout: Duration(seconds: 12),
      validateStatus: (status) {
        return status! < 500;
      },
    );
    try {
      final imageFile1 = await dio.MultipartFile.fromFile(
        selectedImage.value,
        filename: selectedImage.value.split('/').last,
      );
      List image = [imageFile1];

      final formData = dio.FormData.fromMap({
        "chatImage": image,
      });

      final response = await dioClient.post(AppUrls.generateImageLink,
          data: formData,
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': AuthService.token,
          }));

      if (response.statusCode == 200) {
        // final responseData = jsonDecode(response.data);
        final imageLink = response.data["data"][0];
        log("Generated Image Link $imageLink");
        generatedImageLink.value = imageLink;
      }
    } catch (e) {
      log("something went wrong, error: $e");
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
