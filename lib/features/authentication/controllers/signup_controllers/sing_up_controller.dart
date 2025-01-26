import 'dart:convert';
import 'dart:developer';

import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:dio/dio.dart' as dio;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  RxBool termsAndConditions = false.obs;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  void toggleTermsAndConditions() {
    termsAndConditions.value = !termsAndConditions.value;
  }

  /// Ensuring the json body data passing via form data
  getRequestBody() {
    final Map<String, dynamic> jsonBodyData = {
      "fullName": fullNameController.text.trim(),
      "email": emailController.text.trim(),
      "phoneNumber": phoneNumberController.text.trim(),
      "password": passwordController.text.trim(),
      "fcmToken": "example_fcm_token"
    };
    return jsonBodyData;
  }

  Future<void> signUp({
    required String imagePath1,
    required String imagePath2,
    required Map<String, dynamic> bodyData,
  }) async {
    final Dio dioClient = Dio();
    try {
      final bodyDataString = jsonEncode(bodyData);

      final imageFile1 = await dio.MultipartFile.fromFile(
        imagePath1,
        filename: imagePath1.split('/').last,
      );
      final imageFile2 = await dio.MultipartFile.fromFile(
        imagePath2,
        filename: imagePath2.split('/').last,
      );
      final formData = dio.FormData.fromMap({
        'bodyData': bodyDataString,
        'license': imageFile1,
        'passport': imageFile2,
      });

      log('FormData Fields: ${formData.fields}');
      log('FormData Files: ${formData.files}');
      final response = await dioClient.post(
        AppUrls.signUp,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response Data: ${response.data}');
      if (response.statusCode == 201) {
        Get.snackbar("Success", "Successfully created account");
        Get.toNamed(AppRoute.landingScreen);
      } else if (response.statusCode == 409) {
        Get.snackbar(
            "error", "A user is allreadey exist with this email address");
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
