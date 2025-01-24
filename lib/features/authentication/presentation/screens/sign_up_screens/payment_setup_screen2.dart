import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/common/widgets/show_app_logo.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/constants/app_spacers.dart';
import 'package:flutter/material.dart';

class PaymentSetupScreen2 extends StatelessWidget {
  const PaymentSetupScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(height: getHeight(20)),
              ShowAppLogo(),
              VerticalSpace(height: getHeight(20)),
              Text(
                "Credit card Setup",
                style: getTextStyleMsrt(
                    color: Colors.black,
                    fontSize: getWidth(35),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
