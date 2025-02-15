import 'package:courierapp/core/utils/constants/api_constants.dart';
import 'package:courierapp/features/messege/controller/web_socket_client.dart';
import 'package:courierapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/bindings/controller_binder.dart';
import 'core/utils/constants/app_sizes.dart';
import 'core/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final WebSocketClient socketClient = WebSocketClient();
  @override
  Widget build(BuildContext context) {
    socketClient.connect(AppUrls.connectSocket);
    AppSizes().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.init,
      getPages: AppRoute.routes,
      initialBinding: ControllerBinder(),
      themeMode: ThemeMode.light,
      theme: AppTheme.appTheme,
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
    );
  }
}
