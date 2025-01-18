import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: 'Log in',
          fontSize: getWidth(20),
        ),
      ),
    );
  }
}
