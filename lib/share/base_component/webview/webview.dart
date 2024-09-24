import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({super.key, required this.url});
  final String url;

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  InAppWebViewController? webViewController;
  @override
  void initState() {
    EasyLoading.show(dismissOnTap: true);
    super.initState();
  }
  


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
          initialUserScripts: UnmodifiableListView<UserScript>([]),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onLoadStop: (controll, uri) {
            EasyLoading.dismiss(animation: true);
          },
          shouldOverrideUrlLoading:
              (controller, shouldOverrideUrlLoadingRequest) async {
            var uri = shouldOverrideUrlLoadingRequest.request.url;
            print('flutter: ${uri.toString()}');
            if (uri != null) {
              // DeepLinkUtils.executeDeepLink(uri.toString(), context);
            }
            return Platform.isIOS
                ? NavigationActionPolicy.ALLOW
                : NavigationActionPolicy.CANCEL;
          },
          onReceivedServerTrustAuthRequest: (InAppWebViewController controller,
              URLAuthenticationChallenge challenge) async {
            return ServerTrustAuthResponse(
                action: ServerTrustAuthResponseAction.PROCEED);
          },
        ));
  }
}
