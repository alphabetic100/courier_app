import 'dart:developer';
import 'package:courierapp/core/common/widgets/error_snakbar.dart';
import 'package:courierapp/core/common/widgets/progress_indicator.dart';
import 'package:courierapp/core/common/widgets/show_payment_success_dialog.dart';
import 'package:courierapp/core/services/Auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constants/api_constants.dart';
import '../utils/stripe_keys.dart';

class StripeService {
  StripeService._();
  static final StripeService instance = StripeService._();

  String? customerId, parcelId, travelerAccountId;
  double? price;
  String? _travellerName;

  static bool isLoading = false;

  Future<void> savePaymentMethodStart(
      {required String customerId1,
      required double price1,
      required String pmId,
      required String parcelId1,
      required String travelerAccountId1}) async {
    customerId = customerId1;
    price = price1;
    parcelId = parcelId1;
    travelerAccountId = travelerAccountId1;

    debugPrint('customerId: $customerId');
    debugPrint('parcelId: $parcelId');
    debugPrint('travelerAccountId: $travelerAccountId');
    debugPrint('price: $price');

    await paymentConfirm(pmId);
  }

  Future<void> paymentStart(
      {required String customerId1,
      required double price1,
      required String parcelId1,
      required String travelerAccountId1,
      required String travellerName}) async {
    customerId = customerId1;
    price = price1;
    parcelId = parcelId1;
    travelerAccountId = travelerAccountId1;
    _travellerName = travellerName;
    debugPrint('customerId: $customerId');
    debugPrint('price: $price');

    await setupPaymentMethod();
  }

  Future<void> setupPaymentMethod() async {
    try {
      String? setupIntentClientSecret = await _createSetupIntent();

      if (setupIntentClientSecret == null) {
        log('Setup Intent creation failed');
        return;
      }

      log('Setup Intent Created: $setupIntentClientSecret');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret: setupIntentClientSecret,
          merchantDisplayName: "Bd Calling IT",
        ),
      );

      await _confirmSetupIntent(setupIntentClientSecret);
    } catch (e) {
      log('Setup Failed: $e');
    }
  }

  Future<String?> _createSetupIntent() async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "payment_method_types[]": "card",
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/setup_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
          },
        ),
      );

      if (response.data != null) {
        log('Setup Intent Response: ${response.data}');
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      log('Error creating SetupIntent: $e');
      return null;
    }
  }

  Future<void> _confirmSetupIntent(String setupIntentClientSecret) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      log('Setup Successful!');

      await _getSetupDetails(setupIntentClientSecret);
    } catch (e) {
      log('Setup Confirmation Failed: $e');
    }
  }

  Future<void> _getSetupDetails(String setupIntentClientSecret) async {
    try {
      final Dio dio = Dio();
      final setupIntentId = setupIntentClientSecret.split('_secret')[0];

      log('Setup Intent ID: $setupIntentId');

      var response = await dio.get(
        "https://api.stripe.com/v1/setup_intents/$setupIntentId",
        options: Options(
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded'
          },
        ),
      );

      log('Response Status: ${response.statusCode}');
      log('Response Data: ${response.data}');

      if (response.data != null && response.data['payment_method'] != null) {
        String paymentMethodId = response.data['payment_method'];

        await paymentConfirm(paymentMethodId);

        log('Payment Method ID: $paymentMethodId');
      }
    } catch (e) {
      log('Failed to retrieve setup details: $e');
    }
  }

  Future<void> paymentConfirm(
    String pmId,
  ) async {
    final url = Uri.parse(AppUrls.confirmPayment);

    debugPrint(url.toString());
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': AuthService.token.toString(),
    };
    final body = jsonEncode({
      "customerId": customerId,
      "paymentMethodId": pmId,
      "amount": price,
      "parcelId": parcelId,
      "travelerAccountId": travelerAccountId
    });
    log(body);
    log(AuthService.token.toString());
    try {
      //isLoading = true;

      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      log(response.statusCode.toString());
      //isLoading = false;

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        log(responseData.toString());
        if (responseData['success'] == true) {
          isLoading = false;
          hideProgressIndicator();
          Future.delayed(
              Duration(
                milliseconds: 400,
              ), () {
            Get.defaultDialog(
                title: "",
                barrierDismissible: false,
                backgroundColor: Colors.transparent,
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                content: ShowPaymentSuccessDialog(
                  travellerName: _travellerName ?? "Guest",
                ));
          });
          //  Get.offAll(() => ());
          /*Get.snackbar(
          "Success",
          "Your payment is successful.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.deepPurple,
          colorText: Colors.white,
          icon: const Icon(Icons.check_circle, color: Colors.green),
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(10),
          borderRadius: 8,
        );*/
        } else {
          //isLoading = false;
          /*
        EasyLoading.show(
          status: 'Please check your card information',
        );*/
          errorSnakbar(errorMessage: "Something went wrong, please try again");
        }
      } else {
        // isLoading = false;
        log('Request failed with status: ${response.body}');
      }
    } catch (e) {
      // isLoading = false;
      log('An error occurred: $e');
    }
  }

//start Backend api called

  // Future<void> cardData(String paymentMethodId) async {
  //   final url =
  //   Uri.parse('https://employee-beryl.vercel.app/api/v1/stripe/save-card');
  //
  //   final body = jsonEncode({"paymentMethodId": paymentMethodId});
  //
  //   try {
  //
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': accessToken
  //       },
  //       body: body,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final responseData = jsonDecode(response.body);
  //       log('Response:.... ${responseData['message']}');
  //       log('Status code: ${response.statusCode}');
  //       log('Status code200: ${response.body}');
  //       paymentConfirm(paymentMethodId);
  //     } else {
  //       log('Failed to create customer: ${response.body}');
  //     }
  //   } catch (error) {
  //     log('Error: $error');
  //   }finally{
  //     EasyLoading.dismiss();
  //   }
  // }
  // Future<void> paymentConfirm(String pmId) async {
  //
  //   final url = Uri.parse('https://employee-beryl.vercel.app/api/v1/stripe/buy-token');
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization':accessToken.toString(),
  //   };
  //   final body = jsonEncode({
  //     "amount": 50,
  //     "paymentMethodId":pmId
  //   });
  //  log(body);
  //   try {
  //
  //     final response = await http.post(
  //       url,
  //       headers: headers,
  //       body: body,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final responseData = jsonDecode(response.body);
  //       if (responseData['success'] == true) {
  //         // final String paymentId=responseData["data"]["paymentIntentId"];
  //         Get.snackbar(
  //           "Success",
  //           "Your payment is successful.",
  //           snackPosition: SnackPosition.TOP,
  //           backgroundColor: Colors.deepPurple,
  //           colorText: Colors.white,
  //           icon: const Icon(Icons.check_circle, color: Colors.green),
  //           duration: const Duration(seconds: 3),
  //           margin: const EdgeInsets.all(10),
  //           borderRadius: 8,
  //         );
  //       } else {
  //         EasyLoading.show(
  //           status: 'Please check your card information',
  //         );
  //       }
  //     } else {
  //       log('Request failed with status: ${response.body}');
  //     }
  //   } catch (e) {
  //     log('An error occurred: $e');
  //   }
  // }
  //
  //
  // Future<void> addNewCard(String paymentMethodId, String customerId) async {
  //
  //   final url = Uri.parse(
  //       'https://employee-beryl.vercel.app/api/v1/stripe/save-new-card');
  //
  //   final body = jsonEncode(
  //       {"customerId": customerId, "paymentMethodId": paymentMethodId});
  //
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': accessToken
  //       },
  //       body: body,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final responseData = jsonDecode(response.body);
  //       log('Response:.... ${responseData['message']}');
  //       log('Status code: ${response.statusCode}');
  //       log('Status code200: ${response.body}');
  //       final CardController cardMethodController =
  //       Get.put(CardController());
  //       cardMethodController.getCardMethod();
  //       Get.snackbar(
  //         "Success",
  //         "Card added successfully",
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.deepPurple,
  //         colorText: Colors.white,
  //         icon: const Icon(Icons.check_circle, color: Colors.green),
  //         duration: const Duration(seconds: 3),
  //         margin: const EdgeInsets.all(10),
  //         borderRadius: 8,
  //       );
  //     } else {
  //       log('Failed to create customer: ${response.body}');
  //     }
  //   } catch (error) {
  //     log('Error: $error');
  //   }
  // }
}
