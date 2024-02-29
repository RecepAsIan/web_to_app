import 'package:flutter/material.dart';

class HomeTextHigh extends StatelessWidget {
  const HomeTextHigh(
      {super.key, required this.text, this.fountSize, this.color});
  final String text;
  final double? fountSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fountSize ?? 60, color: color, fontWeight: FontWeight.bold),
    );
  }
}
