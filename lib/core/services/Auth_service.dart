import 'dart:developer';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';

class AuthService {
  static const String _tokenKey = 'token';
  static const String _rememberMeKey = "rememberMe";

  // Singleton instance for SharedPreferences
  static late SharedPreferences _preferences;

  // Private variables to hold token and userId
  static String? _token;

  // Initialize SharedPreferences (call this during app startup)
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    // Load token and userId from SharedPreferences into private variables
    _token = _preferences.getString(_tokenKey);
    _id = await getId();
    _customerId = await getcustomerId();
  }

  // Check if a token exists in local storage
  static bool hasToken() {
    return _preferences.containsKey(_tokenKey);
  }

  // Save the token and user ID to local storage
  static Future<void> saveToken(String token, String id) async {
    try {
      await _preferences.setString(_tokenKey, token);
      // Update private variables
      _token = token;
    } catch (e) {
      log('Error saving token: $e');
    }
  }

  // Clear authentication data (for logout or clearing auth data)
  static Future<void> logoutUser() async {
    try {
      bool? rememberMe = _preferences.getBool(_rememberMeKey);

      // If "Remember Me" is NOT enabled, clear email and password from SharedPreferences
      if (rememberMe != true) {
        await _preferences.remove('email');
        await _preferences.remove('password');
      }

      // Clear other auth-related data (but not email/password if "Remember Me" is on)
      await _preferences.remove(_tokenKey);
      await _preferences.remove("ID");

      // Reset the private variables
      _token = null;

      _id = null;
      await goToLogin();
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  // Navigate to the login screen (e.g., after logout or token expiry)
  static Future<void> goToLogin() async {
    Get.offAllNamed(AppRoute.loginScreen);
  }

  // Getter for token
  static String? get token => _token;
  static String? _id;

  static Future<String?> getId() async {
    _preferences = await SharedPreferences.getInstance();
    _id = _preferences.getString("ID");
    return _id;
  }

  static Future saveId({required String id}) async {
    _preferences = await SharedPreferences.getInstance();
    log("id saveing");
    _id = id;
    await _preferences.setString("ID", id);
  }

// Getter for user id
  static String? get userId => _id;

  //Save customerId
  static String? _customerId;
  static Future saveCustomerId({required String customerID}) async {
    _preferences = await SharedPreferences.getInstance();
    _customerId = customerID;
    log("Customer Id saveing");
    await _preferences.setString("CUSTOMERID", customerID);
  }

  static Future<String?> getcustomerId() async {
    _preferences = await SharedPreferences.getInstance();
    _customerId = _preferences.getString("CUSTOMERID");
    return _customerId;
  }

  //Gatter for Customer id
  static String? get customerId => _customerId;
}
