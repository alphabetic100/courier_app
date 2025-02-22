import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppHelperFunctions {
  AppHelperFunctions._();
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static String? phoneNumberValidator(String? value, String countryCode) {
    if (value == null || value.isEmpty) {
      return "Phone Number is required";
    }

    int validLength = getValidPhoneLength(countryCode);

    if (validLength == -1) {
      return "Invalid country code";
    }

    if (!RegExp(r'^\d{${validLength}}$').hasMatch(value)) {
      return "Enter a valid phone number with $validLength digits for $countryCode";
    }

    return null;
  }

  static int getValidPhoneLength(String countryCode) {
    Map<String, int> countryPhoneLengths = {
      '+880': 11, // Bangladesh
      '+1': 10, // USA
      '+44': 10, // UK
      '+91': 10,
      '+61': 9,
      '+49': 11,
      '+33': 9,
      '+81': 10,
      '+55': 11,
      '+34': 9,
    };

    return countryPhoneLengths[countryCode] ?? -1;
  }

  static String formateDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('MMM d, y').format(dateTime);
  }

  static String timeAgo(DateTime dateTime) {
    Duration difference = DateTime.now().difference(dateTime);

    if (difference.inSeconds < 60) {
      return "Updated just now";
    } else if (difference.inMinutes < 60) {
      return "Updated ${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "Updated ${difference.inHours} hours ago";
    } else if (difference.inDays < 30) {
      return "Updated ${difference.inDays} days ago";
    } else {
      return "Updated on ${DateFormat('yyyy-MM-dd').format(dateTime)}";
    }
  }
}
