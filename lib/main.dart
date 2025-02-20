import 'package:courierapp/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'core/services/Auth_service.dart';
import 'core/utils/stripe_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(ProfileController());
  await AuthService.init();
  await _setup();
  runApp(MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
}
