import 'package:flutter/material.dart';
import 'package:web_to_app/product/constants/color_constants.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(MyColor.paymentButton),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(text,style: const TextStyle(color: MyColor.paymentButtonText,fontSize: 20),),
      ),
    );
  }
}
