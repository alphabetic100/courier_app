import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/common/widgets/success_snakbar.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:courierapp/core/services/network_caller.dart';
import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/my_trip/presentation/widgets/pickup_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:photo_manager/photo_manager.dart';
import 'package:share_plus/share_plus.dart';

class QrController extends GetxController {
  final NetworkCaller networkCaller = NetworkCaller();

  var qrData = "https://www.example.com".obs;

  var scannedData = "No data scanned yet".obs;
  final GlobalKey qrKey = GlobalKey();
  RxBool isPickupSuccess = false.obs;

  void updateScannedData(String data) {
    scannedData.value = data;
    log(scannedData.value);
  }

  Future<void> generateQRforPicUp(String bookingID) async {
    try {
      final Map<String, String> requestBody = {
        "id": bookingID,
        "status": "pickupped"
      };

      final response = await networkCaller.postRequest(AppUrls.generateHexCode,
          token: AuthService.token, body: requestBody);
      if (response.isSuccess) {
        log("++++++++++++++++");

        qrData.value = response.responseData["data"];
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> generateQRforDeliverd(String bookingID) async {
    log("Generating QR for delevery");
    try {
      final Map<String, String> requestBody = {
        "id": bookingID,
        "status": "delivered"
      };
      final response = await networkCaller.postRequest(
          AppUrls.generateCodeDeliverd,
          token: AuthService.token,
          body: requestBody);
      if (response.isSuccess) {
        qrData.value = response.responseData["data"];
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  // Traveller part

  Future<void> verifyPicupCode(String token, BuildContext context) async {
    try {
      final Map<String, String> requestBody = {
        "token": token,
      };
      showProgressIndicator();
      final authToken = AuthService.token;
      Future.delayed(
        Duration(milliseconds: 100),
      );
      final response = await networkCaller.postRequest(AppUrls.verifyPicupCode,
          token: authToken, body: requestBody);
      hideProgressIndicator();
      if (response.isSuccess) {
        isPickupSuccess.value = true;
        showDialog(
            context: context,
            builder: (context) {
              return PickupSuccessDialog();
            });

        log("Code verification successed");
      } else {
        Future.delayed(Duration(microseconds: 200), () {
          errorSnakbar(errorMessage: response.errorMessage);
        });
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> verifyCodeDeliverd(String token) async {
    try {
      final Map<String, String> requestBody = {
        "token": token,
      };

      final response = await networkCaller.postRequest(
          AppUrls.verifyCodeDeliverd,
          token: AuthService.token,
          body: requestBody);

      if (response.isSuccess) {
        log("Code verification successed");
      } else {
        errorSnakbar(errorMessage: response.errorMessage);
      }
    } catch (e) {
      log("Something went wrong, error: $e");
    }
  }

  Future<void> saveQrToGallery(
    GlobalKey key,
    String fileName,
  ) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await (image.toByteData(format: ui.ImageByteFormat.png));

      if (byteData != null) {
        final result = await ImageGallerySaverPlus.saveImage(
            byteData.buffer.asUint8List(),
            name: fileName);
        if (result["isSuccess"]) {
          successSnakbr(successMessage: "QR Downloaded Successfully");
        } else {
          errorSnakbar(errorMessage: "Something went wrong, please try again");
        }
        log(result.toString());
      }
    } catch (e) {
      log('Error capturing and saving image: $e');
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) {
      return "N/A";
    }
    return DateFormat('d MMMM yyyy').format(date);
  }

  // Share Qr as pdf
  Future<void> shareQrFile(
    GlobalKey key,
    String fileName,
  ) async {
    try {
      // Render the widget to an image
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        return;
      }
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // Get the directory to save the image
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      // Save the image
      await file.writeAsBytes(pngBytes);

      // Share or download the file
      await Share.shareXFiles(
        [XFile(file.path)],
      );
    } catch (e) {
      print('Error capturing image: $e');
    }
  }
}
