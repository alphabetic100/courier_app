import 'dart:developer';

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/messege/model/my_chatlist_model.dart';
import 'package:get/get.dart';

class MessageScreenController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();

  Rx<MyChatlistModel?> chatlists = Rx<MyChatlistModel?>(null);
  Future<void> getMyChatList() async {
    try {
      final response = await networkCaller.getRequest(AppUrls.getMyChatLists,
          token: AuthService.token);
      if (response.isSuccess) {
        chatlists.value = MyChatlistModel.fromJson(response.responseData);
        update();
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(microseconds: 200), () {
      getMyChatList();
    });
  }
}
