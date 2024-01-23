import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewView extends StatelessWidget {
  const WebviewView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
