import 'package:flutter/material.dart';

class MyPaymentTextField extends StatefulWidget {
  const MyPaymentTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.onChanged,
  });
  final TextEditingController controller;
  final String text;
  final Function(String)? onChanged;

  @override
  State<MyPaymentTextField> createState() => _MyPaymentTextFieldState();
}

class _MyPaymentTextFieldState extends State<MyPaymentTextField> {
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: myFocusNode,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        filled: true,
        fillColor: myFocusNode.hasFocus ? Colors.white : Colors.grey[200],
        hintText: widget.text,
      ),
    );
  }
}
