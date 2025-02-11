import 'package:courierapp/core/common/widgets/create_trip_top_body.dart';
import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_bottom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/my_trip/controller/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_bar_code/qr/qr.dart';

class QRCodeGeneratorScreen extends StatelessWidget {
  QRCodeGeneratorScreen({super.key});
  final QrController controller = Get.put(QrController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CreateTripTopBody(title: "QR Code"),
          Spacer(),
          Container(
            width: AppSizes.width * 0.9,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(IconPath.qrBorder),
            )),
            child: Center(child: QRCode(data: controller.qrData.value)),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
          isPrimaryButton: false,
          onTap: () {},
          primaryWidget: Row(
            children: [
              Expanded(
                  child: CustomButton(
                isPrimary: false,
                onPressed: () {},
                child: CustomText(
                  text: "Share",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              )),
              HorizontalSpace(width: 10),
              Expanded(
                  child: CustomButton(
                isPrimary: true,
                onPressed: () {
                  //  Get.to(() => QRCodeGeneratorScreen());
                },
                child: CustomText(
                  text: "Download QR",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ))
            ],
          )),
    );
  }
}
