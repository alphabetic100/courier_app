import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_back_button.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Next",
              style: getTextStyleMsrt(color: Colors.black),
            ),
            CustomButton(
              onPressed: () {},
              child: Text(
                "Go on",
                style: getTextStyleMsrt(color: Colors.white),
              ),
            ),
            CustomButton(
              onPressed: () {},
              isPrimary: false,
              child: Text(
                "Go on",
                style: getTextStyleMsrt(color: AppColors.primary),
              ),
            ),
            CustomTextButton(onPressed: () {}, text: "text button"),
            CustomBackButton()
          ],
        ),
      ),
    );
  }
}
