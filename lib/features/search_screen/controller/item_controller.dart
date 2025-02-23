import 'dart:convert';
import 'dart:developer';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:courierapp/features/search_screen/models/item_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ItemController extends GetxController {
  NetworkCaller networkCaller = NetworkCaller();
  Rx<ItemModel?> myItems = Rx<ItemModel?>(null);
  final GlobalKey<FormState> validator = GlobalKey<FormState>();
  final TextEditingController itemName = TextEditingController();
  final TextEditingController itemDescription = TextEditingController();
  RxList<String> selectedImages = [
    "",
    "",
    "",
    "",
    "",
  ].obs;

  var itemWeight = "5kg".obs;
  RxBool isLoading = false.obs;

  Future<void> getMyItems() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.getMyItems,
          token: AuthService.token);
      log(AuthService.token.toString());
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
      isLoading.value = true;

      final bodyData = {
        "name": itemName.text.trim(),
        "description": itemDescription.text.trim(),
        "weight": double.parse(itemWeight.value.replaceAll("kg", "")),
      };
      final requestBodyData = jsonEncode(bodyData);

      List<dio.MultipartFile> imageFiles = [];
      for (String imagePath in selectedImages) {
        if (imagePath.isNotEmpty) {
          final imageFile = await dio.MultipartFile.fromFile(
            imagePath,
            filename: AppHelperFunctions.generateUniqueFileName(imagePath),
          );
          imageFiles.add(imageFile);
        }
      }

      final formData = dio.FormData.fromMap({
        'bodyData': requestBodyData,
        "image": imageFiles,
      });

      log('FormData Fields: ${formData.fields}');
      log('FormData Files: ${formData.files}');

      final response = await dioClient.post(
        AppUrls.getMyItems,
        data: formData,
        options: Options(headers: {
          'Authorization': AuthService.token,
        }),
      );
      isLoading.value = false;

      if (response.statusCode == 200 || response.data["success"]) {
        successSnakbr(successMessage: "Item added successfully");
        selectedImages.value = selectedImages
            .map((image) => image.isNotEmpty ? "" : image)
            .toList();

        log(isLoading.value.toString());
      } else {
        errorSnakbar(errorMessage: response.data["message"]);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteItem(String itemId) async {
    final requestUrl = "${AppUrls.getMyItems}/$itemId";
    try {
      final response = await networkCaller.postRequest(
        requestUrl,
        token: AuthService.token,
        body: {},
      );
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
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 200), () {
      getMyItems();
    });
  }
}
