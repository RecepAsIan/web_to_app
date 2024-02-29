import 'package:flutter/material.dart';
import 'package:web_to_app/feature/auth/login_register_mixin.dart';
import 'package:web_to_app/product/constants/color_constants.dart';
import 'package:web_to_app/product/constants/string_constants.dart';
import 'package:web_to_app/product/utility/padding.dart';
import 'package:web_to_app/product/widgets/text/home_text_high.dart';
import 'package:web_to_app/product/widgets/textfield/text_field.dart';

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
      body: Center(
        child: Padding(
          padding: AppPadding.pageHighPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    //image will come here
                    child: Placeholder(),
                  ),
                  Padding(
                    padding: AppPadding.leftNormalPadding,
                    child: HomeTextHigh(
                      text: 'Website to App',
                      fountSize: 40,
                      color: MyColor.paymentButton,
                    ),
                  )
                ],
              ),
              Padding(
                padding: AppPadding.topNormalPadding,
                child: MyTextField(
                  controller: email,
                  text: MyString.email,
                ),
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
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(MyColor.paymentButton)),
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
                        ? const Text(
                            'login',
                            style: TextStyle(color: MyColor.paymentButtonText),
                          )
                        : const Text(
                            'register',
                            style: TextStyle(color: MyColor.paymentButtonText),
                          ),
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
                          ? const Text(
                              'Register now',
                              style: TextStyle(
                                color: MyColor.paymentButton,
                              ),
                            )
                          : const Text(
                              'Log in now.',
                              style: TextStyle(
                                color: MyColor.paymentButton,
                              ),
                            ),
                    )
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
