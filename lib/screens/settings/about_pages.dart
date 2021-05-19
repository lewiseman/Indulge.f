import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indulge_me/widgets/common.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:io';

class AboutWebView extends StatefulWidget {
  AboutWebView(this.title, this.webUrl);
  final String title;
  final String webUrl;
  @override
  _AboutWebViewState createState() => _AboutWebViewState();
}

class _AboutWebViewState extends State<AboutWebView> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: normalAppBar(widget.title),
      body: WebView(
        key: _key,
        initialUrl: widget.webUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        gestureNavigationEnabled: true,
      ),
    );
  }
}
