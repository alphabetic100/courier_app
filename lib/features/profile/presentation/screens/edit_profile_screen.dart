import 'dart:io';

import 'package:courierapp/core/common/widgets/custom_app_bar.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/message_notification_box.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/profile/controller/edit_profile_controller.dart';
import 'package:courierapp/features/profile/controller/profile_controller.dart';
import 'package:courierapp/features/profile/presentation/screens/change_password_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/styles/get_text_style.dart';
import '../../../../core/common/widgets/custom_bottom_app_bar.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text_button.dart';
import '../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../core/common/widgets/phone_number_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfileController = Get.put(EditProfileController());
    final controller = Get.put(ProfileController());

    final Map<String, dynamic> arguments = Get.arguments;

    final String initialImagePath = arguments['imagePath'] ?? "";
    final String fullName = arguments['fullName'] ?? 'Enter your Name';
    final String phoneNumber = arguments['phoneNumber'] ?? 'Enter your Email';
    final String emailAddress = arguments["emailAddress"] ?? 'Enter your phone';
    final String password = arguments["password"] ?? 'Enter your phone';
    final String verification = arguments["verification"] ?? 'Enter your phone';

    TextEditingController fullNameTEController =
        TextEditingController(text: fullName);
    TextEditingController emailTEController =
        TextEditingController(text: emailAddress);
    TextEditingController passwordTEController =
        TextEditingController(text: password);
    TextEditingController phoneNumberTEController =
        TextEditingController(text: phoneNumber);

    return Scaffold(
      appBar: CustomAppBar(
        ontapBackButton: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.getProfileDetails();
          });
          Get.back();
        },
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: getWidth(16),
            ),
            child: MessageNotificationBox(),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                      text: "Edit Profile",
                      fontSize: getWidth(25),
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VerticalSpace(height: getHeight(20)),
                  Divider(
                    height: getHeight(1),
                    color: Color(0xffCCD9D6),
                  ),
                ],
              ),
            ),
            VerticalSpace(height: getHeight(20)),
            Padding(
              padding:
                  EdgeInsets.only(left: getWidth(16), right: getHeight(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => CircleAvatar(
                        radius: getWidth(65),
                        backgroundImage: editProfileController
                                .profileImage.isNotEmpty
                            ? FileImage(
                                File(editProfileController.profileImage.value))
                            : initialImagePath.isNotEmpty
                                ? NetworkImage(initialImagePath)
                                : AssetImage(ImagePath.profile)
                                    as ImageProvider,
                      )),
                  /*
                  SizedBox(height: getHeight(8),),


                  CustomTextButton(
                    isUnderline: true,
                    onPressed: () {},
                    text: "Change profile",
                    fontWeight: FontWeight.w600,
                    fontSize: getHeight(16),
                    color: Color(0xff003087),

                  ),
                  SizedBox(
                    height: getHeight(24),
                  ),
                  CustomTextAndTextFormField(
                    text: "Full Name",
                    controller: fullNameTEController,
                  ),
                  SizedBox(
                    height: getHeight(16),
                  ),

                  ),*/
                  SizedBox(
                    height: getHeight(8),
                  ),
                  CustomTextButton(
                      fontSize: getWidth(15),
                      fontWeight: FontWeight.w600,
                      isUnderline: true,
                      onPressed: () async {
                        await editProfileController.getImage();
                      },
                      text: "Change profile"),
                  SizedBox(
                    height: getHeight(24),
                  ),
                  CustomTextAndTextFormField(
                    text: "Full Name",
                    controller: fullNameTEController,
                  ),
                  SizedBox(
                    height: getHeight(16),
                  ),
                  Text(
                    "Phone Number",
                    style: getTextStyleMsrt(
                        color: AppColors.black,
                        fontSize: getWidth(14),
                        fontWeight: FontWeight.w600),
                  ),
                  VerticalSpace(height: getHeight(8)),
                  PhoneNumberTextField(
                    controller: phoneNumberTEController,
                    validator: (value) {
                      return null;

                      // return AppHelperFunctions.phoneNumberValidator(
                      //     value, singUpController.phoneNumberController.text);
                    },
                  ),
                  SizedBox(
                    height: getHeight(16),
                  ),
                  CustomTextAndTextFormField(
                    text: "Email Address",
                    controller: emailTEController,
                    readOnly: true,
                  ),
                  SizedBox(
                    height: getHeight(16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Password",
                        fontSize: getWidth(14),
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      CustomTextButton(
                        isUnderline: true,
                        onPressed: () {
                          Get.to(() => ChangePasswordOtpScreen());
                        },
                        text: "Change",
                        fontWeight: FontWeight.w600,
                        fontSize: getHeight(14),
                        color: Color(0xff003087),
                      ),
                    ],
                  ),
                  VerticalSpace(height: getHeight(10)),
                  CustomTexFormField(
                    controller: passwordTEController,
                  ),
                  SizedBox(
                    height: getHeight(16),
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Verification status: ",
                        fontSize: getWidth(16),
                        color: Color(0xff262B2B),
                      ),
                      SizedBox(
                        width: getWidth(4),
                      ),
                      CustomText(
                        text: verification == "true"
                            ? "Verified "
                            : "Not Verified",
                        fontSize: getWidth(16),
                        color: Color(0xff2BCD31),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isPrimaryButton: false,
        onTap: () {},
        primaryWidget: Row(
          children: [
            Expanded(
              child: CustomButton(
                  isPrimary: false,
                  onPressed: () {
                    // Get.defaultDialog(
                    //   title: "Worning",
                    // );
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return ShowPaymentSuccessDialog();
                    //     });
                  },
                  child: CustomText(
                    text: "Cancel",
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey,
                  )),
            ),
            HorizontalSpace(width: getWidth(16)),
            Expanded(
              child: CustomButton(
                  onPressed: () {
                    editProfileController.updateProfile(
                        fullName: fullNameTEController.text,
                        phone: phoneNumberTEController.text);
                  },
                  child: CustomText(
                    text: "Save Changes",
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextAndTextFormField extends StatelessWidget {
  const CustomTextAndTextFormField({
    super.key,
    required this.text,
    required this.controller,
    this.validator,
    this.readOnly,
  });

  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          fontSize: getWidth(14),
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        VerticalSpace(height: getHeight(10)),
        CustomTexFormField(
            controller: controller,
            readOnly: readOnly ?? false,
            validator: validator),
      ],
    );
  }
}
