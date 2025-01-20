import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/common/widgets/custom_text_form_field.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShowAppLogo(),
              VerticalSpace(height: getHeight(20)),
              Text(
                "Log in",
                style: getTextStyleMsrt(
                    color: Colors.black,
                    fontSize: getWidth(40),
                    fontWeight: FontWeight.bold),
              ),
              VerticalSpace(height: getHeight(20)),
              Text(
                "Deliver smarter, faster, and hassle-free",
                style: getTextStyleMsrt(color: Color(0xFF84828E)),
              ),
              VerticalSpace(height: getHeight(20)),
              CustomTexFormField(
                hintText: "Email",
              )
            ],
          ),
        ),
      )),
    );
  }
}
