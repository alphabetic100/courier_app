import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RequestShippingController extends GetxController {
  var itemWeight = 1.0.obs;
  var selectedImages = <XFile>[].obs;

  
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImages.add(image);
    }
  }
}
