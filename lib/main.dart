import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_to_app/feature/admin/admin_view.dart';
import 'package:web_to_app/feature/home/home_view.dart';
import 'package:web_to_app/product/initialize/application_start.dart';
import 'package:flutter_stripe_web/flutter_stripe_web.dart';

void main() async {
  await ApplicationStart.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web to App',
      home: AdminView(),
    );
  }
}
