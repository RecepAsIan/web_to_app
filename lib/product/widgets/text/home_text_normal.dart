import 'package:flutter/cupertino.dart';
import 'package:web_to_app/product/constants/color_constants.dart';

class HomeTextNormal extends StatelessWidget {
  const HomeTextNormal({
    super.key,
    required this.text,
    this.fountSize,
  });
  final String text;
  final double? fountSize;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: MyColor.paymentButton,
          fontSize: fountSize ?? 24,
          fontWeight: FontWeight.bold),
    );
  }
}
