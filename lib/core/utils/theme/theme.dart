import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

// import 'custom_themes/app_bar_theme.dart';
// import 'custom_themes/elevated_button_theme.dart';
// import 'custom_themes/text_field_theme.dart';
// import 'custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    // Primary and secondary colors
    primaryColor: AppColors.primary,
    primarySwatch: MaterialColor(AppColors.primary.value, {
      50: Color.lerp(Colors.white, AppColors.primary, 0.1)!,
      100: Color.lerp(Colors.white, AppColors.primary, 0.2)!,
      200: Color.lerp(Colors.white, AppColors.primary, 0.3)!,
      300: Color.lerp(Colors.white, AppColors.primary, 0.4)!,
      400: Color.lerp(Colors.white, AppColors.primary, 0.5)!,
      500: AppColors.primary,
      600: Color.lerp(Colors.black, AppColors.primary, 0.6)!,
      700: Color.lerp(Colors.black, AppColors.primary, 0.7)!,
      800: Color.lerp(Colors.black, AppColors.primary, 0.8)!,
      900: Color.lerp(Colors.black, AppColors.primary, 0.9)!,
    }),

    // Color scheme
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.white,
      surface: AppColors.surfaceLight,
      error: AppColors.error,
      onPrimary: AppColors.textWhite,
      onSecondary: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      onError: AppColors.textWhite,
    ),

    // Background color
    scaffoldBackgroundColor: AppColors.primaryBackground,

    // Text theme
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

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textWhite,
      elevation: 0,
    ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textWhite,
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyContainer,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
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

    // Card theme
    cardTheme: CardTheme(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    // Icon theme
    iconTheme: IconThemeData(
      color: AppColors.primary,
    ),

    // Progress indicator theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),
  );
  // static ThemeData lightTheme = ThemeData(
  //     useMaterial3: true,
  //     // fontFamily: 'Poppins'
  //     brightness: Brightness.light,
  //     primaryColor: Colors.red,
  //     scaffoldBackgroundColor: Colors.white,
  //     textTheme: AppTextTheme.lightTextTheme,
  //     elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
  //     appBarTheme: App_BarTheme.lightAppBarTheme,
  //     inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme);

  // static ThemeData darkTheme = ThemeData(
  //     useMaterial3: true,
  //     // fontFamily: 'Poppins'
  //     brightness: Brightness.dark,
  //     primaryColor: Colors.red,
  //     scaffoldBackgroundColor: Colors.black,
  //     textTheme: AppTextTheme.darkTextTheme,
  //     elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
  //     appBarTheme: App_BarTheme.darkAppBarTheme,
  //     inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme);
}
