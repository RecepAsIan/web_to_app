import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin LoginRegisterMixin<T extends StatefulWidget> on State<T> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool loginOrRegister = true;
  void setStateLogin() {
    setState(() {
      loginOrRegister = !loginOrRegister;
    });
  }

  void userRegister(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    if (password == confirmPassword) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      } catch (e) {
        print('Hata: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Kayıt oluşturulamadı: $e'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Şifreler eşleşmiyor'),
        ),
      );
    }
  }

  void userLogin({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Hata: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Giriş yapılamadı: $e'),
        ),
      );
    }
  }
}
