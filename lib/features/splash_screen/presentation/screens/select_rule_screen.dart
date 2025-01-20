import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_button.dart';
import 'package:courierapp/core/common/widgets/custom_text_button.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:courierapp/core/utils/constants/icon_path.dart';
import 'package:courierapp/core/utils/constants/image_path.dart';
import 'package:courierapp/features/splash_screen/controllers/sender_reciver_controller.dart';
import 'package:courierapp/features/splash_screen/widgets/rule_button.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectRuleScreen extends StatelessWidget {
  SelectRuleScreen({super.key});
  final SenderReciverController controller = Get.put(SenderReciverController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalSpace(height: getHeight(30)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                width: getWidth(250),
                child: Image.asset(ImagePath.appLogo)),
            VerticalSpace(height: getHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
              child: Text(
                "How would you like to Sign Up",
                style: getTextStyleMsrt(
                  fontSize: getWidth(30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            VerticalSpace(height: getHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
              child: Text(
                "Deliver smarter, faster, and hassle-free",
                style: getTextStyleMsrt(
                  color: Colors.grey,
                  fontSize: getWidth(16),
                ),
              ),
            ),
            VerticalSpace(height: getHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => ruleButton(
                      "Sender",
                      IconPath.senderLogo,
                      () => controller.selectRule("Sender"),
                      controller.selectedRule.value == "Sender",
                    )),
                Obx(() => ruleButton(
                      "Traveler",
                      IconPath.receiverLogo,
                      () => controller.selectRule("Receiver"),
                      controller.selectedRule.value == "Receiver",
                    )),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                  onPressed: () {},
                  child: Text(
                    "Sign up",
                    style: getTextStyleMsrt(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            VerticalSpace(height: getHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Already have an account?")),
                CustomTextButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.loginScreen);
                    },
                    text: "Login"),
              ],
            ),
            VerticalSpace(height: getHeight(40))
          ],
        ),
      ),
    );
  }
}
