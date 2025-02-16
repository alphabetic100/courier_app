import 'package:courierapp/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'core/services/Auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProfileController());
  await AuthService.init();
  runApp(MyApp());
}
