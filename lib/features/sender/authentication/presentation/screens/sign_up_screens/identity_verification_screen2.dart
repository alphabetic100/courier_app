import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/sender/authentication/controllers/signup_controllers/identity_verification_controller.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdentityVerificationScreen2 extends StatelessWidget {
  IdentityVerificationScreen2({super.key});
  final IdentityVerificationController verificationController =
      Get.find<IdentityVerificationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            VerticalSpace(height: getHeight(20)),
            ShowAppLogo(),
            VerticalSpace(height: getHeight(20)),
            Text(
              "Verify Your Identity",
              style: getTextStyleMsrt(
                  color: AppColors.black,
                  fontSize: getWidth(35),
                  fontWeight: FontWeight.bold),
            ),
            VerticalSpace(height: getHeight(10)),
            Text(
              "Upload a valid ID to keep our platform secure.",
              style: getTextStyleMsrt(color: AppColors.bodyTextColor),
            ),
            VerticalSpace(height: getHeight(25)),
            CustomText(
              text: "Upload Front Photo of ID",
              fontWeight: FontWeight.bold,
              color: AppColors.titleTextColor,
            ),
            VerticalSpace(height: getHeight(10)),
            Obx(() {
              return GestureDetector(
                onTap: verificationController.pickImage,
                child: Container(
                    height: AppSizes.height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                    ),
                    child: verificationController.selectedImage.value != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              verificationController.selectedImage.value!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: getHeight(100)),
                            child: Image.asset(
                              ImagePath.uploadPhoto,
                              height: getHeight(20),
                            ),
                          )),
              );
            }),
            Spacer(),
            SizedBox(
              width: AppSizes.width,
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        isPrimary: false,
                        onPressed: () {
                          Get.back();
                        },
                        child: CustomText(
                          text: "Back",
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  HorizontalSpace(width: getHeight(20)),
                  Expanded(
                    child: CustomButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.identityVerificationScreen3);
                        },
                        child: CustomText(
                          text: "Next",
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
            VerticalSpace(height: getHeight(20)),
          ],
        ),
      )),
    );
  }
}
