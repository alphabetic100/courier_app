import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: MaterialColor(
      AppColors.primaryColor.value,
      <int, Color>{
        50: Color.lerp(Colors.white, AppColors.primaryColor, 0.1)!,
        100: Color.lerp(Colors.white, AppColors.primaryColor, 0.2)!,
        200: Color.lerp(Colors.white, AppColors.primaryColor, 0.3)!,
        300: Color.lerp(Colors.white, AppColors.primaryColor, 0.4)!,
        400: Color.lerp(Colors.white, AppColors.primaryColor, 0.5)!,
        500: AppColors.primaryColor,
        600: Color.lerp(AppColors.primaryColor, Colors.black, 0.1)!,
        700: Color.lerp(AppColors.primaryColor, Colors.black, 0.2)!,
        800: Color.lerp(AppColors.primaryColor, Colors.black, 0.3)!,
        900: Color.lerp(AppColors.primaryColor, Colors.black, 0.4)!,
      },
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.white,
      surface: AppColors.surfaceLight,
      error: AppColors.error,
      onPrimary: AppColors.textWhite,
      onSecondary: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      onError: AppColors.textWhite,
    ),
    scaffoldBackgroundColor: AppColors.primaryBackground,
    textTheme: TextTheme(
      displayLarge: TextStyle(color: AppColors.textPrimary),
      displayMedium: TextStyle(color: AppColors.textPrimary),
      displaySmall: TextStyle(color: AppColors.textPrimary),
      headlineLarge: TextStyle(color: AppColors.textPrimary),
      headlineMedium: TextStyle(color: AppColors.textPrimary),
      headlineSmall: TextStyle(color: AppColors.textPrimary),
      titleLarge: TextStyle(color: AppColors.textPrimary),
      titleMedium: TextStyle(color: AppColors.textPrimary),
      titleSmall: TextStyle(color: AppColors.textPrimary),
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
      bodySmall: TextStyle(color: AppColors.textGrey),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.textWhite,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.textWhite,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyContainer,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.surfaceLight),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
  );
}
