import 'dart:developer';

import 'package:courierapp/core/common/widgets/item.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RequestShippingController extends GetxController {
  var itemWeight = 1.0.obs;
  RxInt selectedItems = 0.obs;
  RxString priceSubText = "".obs;
  RxList<String> selectedImages = [
    "",
    "",
    "",
    "",
    "",
  ].obs;

  var items = <Item>[
    Item(
        name: 'Laptop',
        destination: 'New York',
        weight: '09 kg',
        from: "Madrid",
        imagePath: ImagePath.onboarding1),
    Item(
        name: 'Books',
        destination: 'Chicago',
        weight: '16 kg',
        from: "Cicago",
        imagePath: ImagePath.onboarding2),
  ].obs;

  void toggleSelection(int index, int price) {
    items[index].isSelected = !items[index].isSelected;
    if (items[index].isSelected) {
      selectedItems.value += 1;
    } else {
      selectedItems.value -= 1;
    }
    updatePriceSubText(price);
    log(selectedItems.value.toString());
    log(priceSubText.value);
    update();
    items.refresh();
  }

  void updatePriceSubText(int price) {
    priceSubText.value = "\$$price/kg × ${selectedItems.value}";
  }

  Future<void> pickImage(int index) async {
    // Modified to accept index
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Update the specific index instead of adding
      selectedImages[index] = image.path;
    }
  }
}
