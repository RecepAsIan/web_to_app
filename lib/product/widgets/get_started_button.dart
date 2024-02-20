import 'package:flutter/material.dart';
import 'package:web_to_app/feature/auth/auth_view.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue)),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AuthPage(),
        ));
      },
      child: const Padding(
        padding: AppPadding.allLowPadding,
        child: Text(
          MyString.getStarted,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
