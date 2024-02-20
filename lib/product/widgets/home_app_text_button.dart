import 'package:flutter/material.dart';

class HomeAppTextButton extends StatelessWidget {
  const HomeAppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
