import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/custom_app_bar.dart';

class TwitterConditions extends StatelessWidget {
  TwitterConditions({Key? key, required this.link}) : super(key: key);

  final String link;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        maintainBottomViewPadding: true,
        child: Scaffold(
      appBar: ConditionsAppBar(
        toClass: TwitterConditions(link: link),
      ),
      body: WebView(
        initialUrl: link,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    ));
  }
}
