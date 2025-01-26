import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorSnakbar({String? errorMessage}) {
  return Get.snackbar(
    "Error",
    errorMessage ?? "",
    backgroundColor: AppColors.error,
    snackPosition: SnackPosition.TOP,
    colorText: AppColors.white,
    margin: EdgeInsets.all(10),
    borderRadius: 10,
    duration: Duration(seconds: 3),
    messageText: CustomText(
      text: errorMessage ?? "An error occurred",
      color: AppColors.white,
      fontSize: getWidth(16),
      fontWeight: FontWeight.w500,
    ),
  );
}
