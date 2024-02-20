import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

@immutable
class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBaSVB1qvxHjyIC65sLQec_HOPwjYVcF3U",
        authDomain: "web-to-app-f77bb.firebaseapp.com",
        projectId: "web-to-app-f77bb",
        storageBucket: "web-to-app-f77bb.appspot.com",
        messagingSenderId: "39886573171",
        appId: "1:39886573171:web:778620164583e00d1e2406",
      ),
    );
    usePathUrlStrategy();
  }
}
