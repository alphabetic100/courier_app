import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/features/authentication/controllers/signup_controllers/identity_verification_controller.dart';
import 'package:courierapp/features/authentication/presentation/components/select_identity_card.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdentityVerificationScreen1 extends StatelessWidget {
  IdentityVerificationScreen1({super.key});
  final IdentityVerificationController verificationController =
      Get.find<IdentityVerificationController>();
  final List<String> titles = ["National ID", "Passport", "Driver’s License"];
  final List<String> iconPaths = [
    IconPath.nationalID,
    IconPath.passportIcon,
    IconPath.drivingLicence
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(16),
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
                  fontSize: getWidth(32),
                  fontWeight: FontWeight.bold),
            ),
            VerticalSpace(height: getHeight(16)),
            Text(
              "Upload a valid ID to keep our platform secure.",
              style: getTextStyleMsrt(color: AppColors.bodyTextColor),
            ),
            VerticalSpace(height: getHeight(40)),
            CustomText(
              text: "Select ID Type",
              fontWeight: FontWeight.w600,
              fontSize: getWidth(14),
              color: AppColors.titleTextColor,
            ),
            VerticalSpace(height: getHeight(10)),
            Expanded(
                child: ListView.builder(
                    itemCount: titles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: getHeight(20)),
                        child: Obx(() {
                          return GestureDetector(
                            onTap: () {
                              verificationController.selectedIndex.value =
                                  index;
                            },
                            child: SelectIdentityCard(
                                isSelected: verificationController
                                            .selectedIndex.value ==
                                        index
                                    ? true
                                    : false,
                                iconPath: iconPaths[index],
                                title: titles[index]),
                          );
                        }),
                      );
                    })),
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
                  HorizontalSpace(width: getHeight(16)),
                  Expanded(
                    child: CustomButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.identityVerificationScreen2);
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
