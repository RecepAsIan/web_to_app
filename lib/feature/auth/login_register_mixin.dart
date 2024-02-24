import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin LoginRegisterMixin<T extends StatefulWidget> on State<T> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool loginOrRegister = true;
  final DateTime currentTime = DateTime.now();

  //
  void setStateLogin() {
    setState(() {
      loginOrRegister = !loginOrRegister;
    });
  }

  void userRegister({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password == confirmPassword) {
      String formattedDate = DateFormat('dd.MM.yyyy').format(currentTime);
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        String uid = userCredential.user!.uid;

        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'email': email,
          'registerTime': formattedDate,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Register successful!'),
          ),
        );
      } catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Register failed: $e'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
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
