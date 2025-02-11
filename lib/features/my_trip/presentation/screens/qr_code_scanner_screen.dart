import 'dart:convert';

import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/my_trip/controller/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerScreen extends StatelessWidget {
  const QrCodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QrController controller = Get.put(QrController());

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          CreateTripTopBody(title: "Scan QR Code"),
          Spacer(),
          Container(
            height: AppSizes.height * 0.5,
            width: AppSizes.width * 0.9,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(IconPath.qrBorder), fit: BoxFit.fill)),
            child: MobileScanner(
              fit: BoxFit.cover,
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates,
              ),
              onDetect: (
                barcode,
              ) {
                if (barcode.image != null) {
                  final String code = utf8.decode(barcode.image!);
                  controller.updateScannedData(code);
                }
              },
            ),
          ),
          Spacer(),
          Spacer()
        ],
      ),
    );
  }
}
