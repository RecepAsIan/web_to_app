import 'package:flutter/material.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/get_started_button.dart';

class ContainerTextField extends StatefulWidget {
  const ContainerTextField({super.key, required this.url});
  final TextEditingController url;
  @override
  State<ContainerTextField> createState() => _ContainerTextFieldState();
}

class _ContainerTextFieldState extends State<ContainerTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          if (_focusNode.hasFocus) {
            _focusNode.unfocus();
          } else {
            FocusScope.of(context).requestFocus(_focusNode);
          }
        },
        child: Container(
          width: 500,
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
                color: _isHovering ? Colors.blue : Colors.grey.shade400,
                width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(35),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: TextField(
                    focusNode: _focusNode,
                    controller: widget.url,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: MyString.yourWebSiteUrl,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: AppPadding.rightLowPadding,
                child: GetStartedButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
