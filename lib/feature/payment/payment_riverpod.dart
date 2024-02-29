import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_to_app/feature/payment/payment.dart';

class PaymentNotifier extends StateNotifier<PaymentView> {
  PaymentNotifier() : super(const PaymentView());
  final TextEditingController url = TextEditingController();
  final TextEditingController appName = TextEditingController();
  bool android = true;
  bool iphone = true;
  bool androidAndIphone = true;

  void androidButton() {
    android = false;
    iphone = true;
    androidAndIphone = true;
    print(android);
  }

  void iphoneButton() {
    android = true;
    iphone = false;
    androidAndIphone = true;
    print(iphone);
  }

  void androidAndIphoneButton() {
    android = true;
    iphone = true;
    androidAndIphone = false;
    print(androidAndIphone);
  }
}
