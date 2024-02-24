import 'package:flutter/material.dart';
import 'package:web_to_app/feature/auth/login_register_mixin.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/text_field.dart';

class LoginRegisterView extends StatefulWidget {
  const LoginRegisterView({super.key});
  @override
  State<LoginRegisterView> createState() => _LoginRegisterViewState();
}

class _LoginRegisterViewState extends State<LoginRegisterView>
    with LoginRegisterMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: AppPadding.pageHighPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                controller: email,
                text: MyString.email,
              ),
              Padding(
                padding: AppPadding.topLowPadding,
                child: MyTextField(
                  controller: password,
                  text: MyString.password,
                ),
              ),
              if (!loginOrRegister)
                Padding(
                  padding: AppPadding.topLowPadding,
                  child: MyTextField(
                    controller: confirmPassword,
                    text: MyString.password,
                  ),
                ),
              Padding(
                padding: AppPadding.topLowPadding,
                child: ElevatedButton(
                  onPressed: () async {
                    loginOrRegister
                        ? userLogin(email: email.text, password: password.text)
                        : userRegister(
                            email: email.text,
                            password: password.text,
                            confirmPassword: confirmPassword.text);
                  },
                  child: Padding(
                    padding: AppPadding.allLowPadding,
                    child: loginOrRegister
                        ? const Text('login')
                        : const Text('register'),
                  ),
                ),
              ),
              Padding(
                padding: AppPadding.topLowPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginOrRegister
                        ? const Text('Have you not registered yet?')
                        : const Text('Do you have a registered account?'),
                    TextButton(
                        onPressed: () {
                          setStateLogin();
                        },
                        child: loginOrRegister
                            ? const Text('Register now')
                            : const Text('Log in now.'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
