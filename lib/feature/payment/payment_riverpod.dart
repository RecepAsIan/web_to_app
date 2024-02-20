import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_to_app/feature/payment/payment.dart';

class PaymentNotifier extends StateNotifier<PaymentView> {
  PaymentNotifier() : super(const PaymentView());
  final TextEditingController url = TextEditingController();
  final TextEditingController appName = TextEditingController();

  void updateAppName(String value) {
    appName.text = value;
  }
}

