import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/search_screen/models/item_model.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  NetworkCaller networkCaller = NetworkCaller();
  Rx<ItemModel?> myItems = Rx<ItemModel?>(null);

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
}
