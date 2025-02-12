import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/features/profile/controller/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/message_notification_box.dart';

class ChangePasswordScreen extends StatelessWidget {

  final String email;
  ChangePasswordScreen({super.key, required this.email});

  final ChangePasswordController controller = Get.put(ChangePasswordController());

  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        ontapBackButton: () {
          // Uncomment and modify this to enable back functionality
          Navigator.pop(context);
        },
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(16)),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color(0xffFAFAFC),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(height: getHeight(20)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                      child: CustomText(
                        text: "Change Password",
                        fontSize: getWidth(25),
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalSpace(height: getHeight(20)),
                    Divider(height: getHeight(1), color: Color(0xffCCD9D6)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                child: Column(
                  children: [
                    VerticalSpace(height: getHeight(20)),
                    Form(
                      key: changePasswordFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "New Password",
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          VerticalSpace(height: getHeight(10)),
                          CustomTexFormField(
                            controller: controller.newPasswordTEController,
                            isPassword: true,
                            hintText: "Enter your new password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              if (value.length < 6) {
                                return "Password must be at least 6 characters long";
                              }
                              return null;
                            },
                          ),
                          VerticalSpace(height: getHeight(20)),
                          CustomText(
                            text: "Confirm Password",
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          VerticalSpace(height: getHeight(10)),
                          CustomTexFormField(
                            controller: controller.confirmPasswordTEController,
                            isPassword: true,
                            hintText: "Confirm your new password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Confirm Password is required";
                              }
                              if (value !=
                                  controller.newPasswordTEController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          VerticalSpace(height: getHeight(20)),
                          CustomButton(
                            onPressed: () {
                              if (changePasswordFormKey.currentState!
                                  .validate()) {
                                // Implement password change logic here
                                controller.changePassword();
                              }
                            },
                            child: CustomText(
                              text: "Change Password",
                              fontSize: getWidth(18),
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          VerticalSpace(height: getHeight(16)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
