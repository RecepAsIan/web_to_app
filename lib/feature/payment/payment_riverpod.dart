import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:web_to_app/feature/payment/payment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:flutter_stripe_web/flutter_stripe_web.dart' as fw;

class PaymentNotifier extends StateNotifier<PaymentView> {
  PaymentNotifier() : super(const PaymentView());
  final TextEditingController url = TextEditingController();
  final TextEditingController appName = TextEditingController();

  Future<void> initPayment(
    context, {
    required String email,
    required String amount,
  }) async {
    try {
      // Firebase Cloud Function endpoint'ine bir POST isteği yapın
      final response = await http.post(
        Uri.parse(MyString.stripeUrl),
        body: {
          'email': email,
          'amount': amount,
          // Müşteri ve ödeme detayları için diğer gerekli parametreleri ekleyin
        },
      );
      final jsonResponse = jsonDecode(response.body);
      // Elde edilen parametrelerle Stripe Payment Sheet'i başlatın
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Grocery',
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
        ),
      );
      // Payment Sheet'i sunun
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Payment is successful')));
    } catch (e) {
      // Hataları işleyin ve kullanıcıya uygun mesajları gösterin
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      // Gerekirse UI durumunu güncelleyin
    }
  }
}
