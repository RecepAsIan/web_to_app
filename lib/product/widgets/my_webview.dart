import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

class MyWebView extends StatelessWidget {
  final String checkoutUrl;

  MyWebView({required this.checkoutUrl});

  @override
  Widget build(BuildContext context) {
    return Webview(
      url: checkoutUrl,
    );
  }
}
