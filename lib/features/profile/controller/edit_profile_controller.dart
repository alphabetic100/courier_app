import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../../core/services/Auth_service.dart';
import '../../../core/utils/constants/api_constants.dart';

class EditProfileController extends GetxController {
  final RxString profileImage = "".obs;
  RxBool isLoading = false.obs;
  Future<void> getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = image.path;
    }
  }

  Future<void> updateProfile({
    required String fullName,
    required String phone,
  }) async {
    final Map<String, String> requestBody = {
      "fullName": fullName,
      "phoneNumber": phone
    };

    try {
      isLoading.value = true;

      await _sendPutRequestWithHeadersAndImages(
        AppUrls.updateProfile,
        requestBody,
        profileImage.value,
        AuthService.token,
      );
      isLoading.value = false;
      log("Profile updated successfully.");
      Get.snackbar('Success', 'Profile updated successfully!',
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      log('Error updating profile: $e');
      Get.snackbar('Error', 'Failed to update profile. Please try again.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _sendPutRequestWithHeadersAndImages(
    String url,
    Map<String, dynamic> body,
    String? imagePath,
    String? token,
  ) async {
    if (token == null || token.isEmpty) {
      Get.snackbar('Error', 'Token is invalid or expired.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    try {
      var request = http.MultipartRequest('PUT', Uri.parse(url));
      request.headers.addAll({'Authorization': token});
      request.fields['bodyData'] = jsonEncode(body);

      if (imagePath != null && imagePath.isNotEmpty) {
        log('Attaching image: $imagePath');
        request.files.add(await http.MultipartFile.fromPath(
          'profileImage',
          imagePath,
        ));
      }

      log('Request Headers: ${request.headers}');
      log('Request Fields: ${request.fields}');

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Profile updated successfully.');
      } else {
        var errorResponse = await response.stream.bytesToString();
        log('Response error: $errorResponse');
        Get.snackbar('Error', 'Failed to update profile.',
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch (e) {
      log('Request error: $e');
      Get.snackbar('Error', 'Failed to update profile. Please try again.',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }
}


