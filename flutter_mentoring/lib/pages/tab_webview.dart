import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TabWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://yandex.ru',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
