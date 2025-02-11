import 'package:get/get.dart';

class QrController extends GetxController {
  var qrData = "https://www.example.com".obs;

  var scannedData = "No data scanned yet".obs;

  void updateScannedData(String data) {
    scannedData.value = data;
  }
}
