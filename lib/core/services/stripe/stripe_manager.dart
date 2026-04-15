import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:marketi/core/network/end_points.dart';

abstract class StripeManager {
  static final dio = Dio();

  static Future<PaymentStatus> makePayment({
    required int amount,
    required String currency,
  }) async {
    try {
      final clientSecret = await _getClientSecret(
        amount: (amount * 100).toString(),
        currency: currency,
      );
      await _initializePaymentSheet(clientSecret: clientSecret);

      await Stripe.instance.presentPaymentSheet();

      return PaymentStatus.success;
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        return PaymentStatus.canceled;
      }

      debugPrint('Stripe Error: ${e.error.localizedMessage}');
      return PaymentStatus.failed;
    //
    // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      debugPrint('Unexpected Error: $e');
      return PaymentStatus.failed;
    }
  }

  static Future<void> _initializePaymentSheet({
    required String clientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Khaled',
      ),
    );
  }

  static Future<String> _getClientSecret({
    required String amount,
    required String currency,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      EndPoint.stripeBaseUrl,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKey.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );

    final data = response.data;

    if (data == null || !data.containsKey('client_secret')) {
      throw Exception('Stripe: Invalid response or missing client_secret');
    }

    final clientSecret = data['client_secret'];

    if (clientSecret is! String || clientSecret.isEmpty) {
      throw Exception('Stripe: Invalid client_secret format');
    }

    return clientSecret;
  }
}

enum PaymentStatus {
  success,
  canceled,
  failed,
}
