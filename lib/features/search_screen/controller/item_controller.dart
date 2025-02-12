import 'dart:convert';
import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/search_screen/models/item_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ItemController extends GetxController {
  NetworkCaller networkCaller = NetworkCaller();
  Rx<ItemModel?> myItems = Rx<ItemModel?>(null);
  final TextEditingController itemName = TextEditingController();
  final TextEditingController itemDescription = TextEditingController();
  RxList<String> selectedImages = [
    "",
    "",
    "",
    "",
    "",
  ].obs;

  List imageList = [
    "",
    "",
    "",
    "",
    "",
  ];
  var itemWeight = "5kg".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyItems();
  }

  Future<void> getMyItems() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.getMyItems,
          token: AuthService.token);
      if (response.isSuccess) {
        myItems.value = ItemModel.fromJson(response.responseData);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> addItem() async {
    final Dio dioClient = Dio();
    dioClient.options = BaseOptions(
      connectTimeout: Duration(seconds: 12),
      validateStatus: (status) {
        return status! < 500;
      },
    );
    try {
      final bodyData = {
        "name": itemName.text.trim(),
        "description": itemDescription.text.trim(),
        "weight": int.parse(itemWeight.value.replaceAll("kg", "")),
      };
      final requestBodyData = jsonEncode(bodyData);

      final formData = dio.FormData.fromMap({
        'bodyData': requestBodyData,
        "image": selectedImages,
      });
      log('FormData Fields: ${formData.fields}');
      log('FormData Files: ${formData.files}');

      final response = await dioClient.post(AppUrls.getMyItems,
          data: formData,
          options: Options(headers: {
            'Authorization': AuthService.token,
          }));

      if (response.statusCode == 200 || response.data["success"]) {
        successSnakbr(successMessage: "Item added successfully");
      } else {
        errorSnakbar(errorMessage: response.data["message"]);
      }
    } catch (e) {
      log("something went wrong, error: $e");
    }
  }

  Future<void> deleteItem(String itemId) async {
    final requestUrl = "${AppUrls.getMyItems}/$itemId";
    try {
      final response =
          await networkCaller.deleteRequest(requestUrl, AuthService.token);
      if (response.isSuccess) {
        myItems.value!.data.removeWhere(
          (element) => element.id == itemId,
        );
        myItems.refresh();
        successSnakbr(successMessage: "Item deleted successfully");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Seomething went wrong, error: $e");
    }
  }

  Future<void> editItem() async {}

  Future<void> pickImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImages[index] = image.path;
      imageList[index] = await dio.MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      );
      log(imageList[2].toString());
    }
  }
}
