import 'dart:io';

import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class IdentityVerificationController extends GetxController {
  RxInt selectedIndex = 4.obs;
  var selectedImage = Rx<File?>(null);
  var selfieImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    } else {
      Get.snackbar('No Image Selected', 'Please select an image to upload.',
          colorText: AppColors.error);
    }
  }

  Future<void> takeSelfie() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selfieImage.value = File(pickedFile.path);
    } else {
      Get.snackbar('No Image Selected', 'Please select an image to upload.',
          colorText: AppColors.error);
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = 4;
  }
}
