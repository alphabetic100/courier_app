import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/identity_verification_controller.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/sing_up_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdentityVerificationScreen3 extends StatelessWidget {
  IdentityVerificationScreen3({super.key});
  final IdentityVerificationController verificationController =
      Get.find<IdentityVerificationController>();
  final SingUpController singUpController = Get.find<SingUpController>();
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
            VerticalSpace(height: getHeight(40)),
            ShowAppLogo(),
            VerticalSpace(height: getHeight(40)),
            Text(
              "Verify Your Identity",
              style: getTextStyleMsrt(
                  color: AppColors.black,
                  fontSize: getWidth(35),
                  fontWeight: FontWeight.bold),
            ),
            VerticalSpace(height: getHeight(16)),
            Text(
              "Upload a valid ID to keep our platform secure.",
              style: getTextStyleMsrt(
                  color: AppColors.bodyTextColor, fontSize: getWidth(16)),
            ),
            VerticalSpace(height: getHeight(40)),
            CustomText(
              text: "Upload Selfie Holding ID",
              fontWeight: FontWeight.w600,
              color: AppColors.titleTextColor,
            ),
            VerticalSpace(height: getHeight(10)),
            Obx(() {
              return GestureDetector(
                onTap: verificationController.takeSelfie,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: AppColors.grey.withOpacity(0.5),
                  radius: Radius.circular(8),
                  child: SizedBox(
                      height: getHeight(220),
                      width: double.infinity,
                      child: verificationController.selfieImage.value != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                verificationController.selfieImage.value!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.all(getHeight(50)),
                              child: Image.asset(
                                ImagePath.uploadPhoto,
                                height: getHeight(84),
                                width: getWidth(106),
                              ),
                            )),
                ),
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
                        color: Color(0xff003087),
                        onPressed: () {
                          if (verificationController.selfieImage.value ==
                              null) {
                            errorSnakbar(
                                errorMessage:
                                    "Please upload selfie holding your ID");
                          } else {
                            final value =
                                verificationController.selectedIndex.value;
                            singUpController.signUp(
                              selectedIdType: value == 0
                                  ? "nationalId"
                                  : value == 1
                                      ? "passport"
                                      : value == 2
                                          ? "license"
                                          : "",
                              imagePath1: verificationController
                                  .fontSideImage.value!.path,
                              imagePath2: verificationController
                                  .selfieImage.value!.path,
                              imagePath3: verificationController
                                  .backSideImage.value!.path,
                              bodyData: singUpController.getRequestBody(),
                            );
                          }
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
            VerticalSpace(height: getHeight(16)),
          ],
        ),
      )),
    );
  }
}
