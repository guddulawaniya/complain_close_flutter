import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview extends StatefulWidget {

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<webview> {
  bool _isLoading = true;
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          // If WebView can go back, navigate back
          _webViewController.goBack();
          return false; // Prevent the app from exiting
        } else {
          // If WebView cannot go back, allow the app to exit
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Terms and Condition'),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl:'https://www.tbvcsoft.com/',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (String url) {
                setState(() {
                  _isLoading = false;
                });
              },
              onWebViewCreated: (WebViewController controller) {
                _webViewController = controller;
              },
              navigationDelegate: (NavigationRequest request) {
                // Handle navigation requests here if needed
                return NavigationDecision.navigate;
              },
            ),
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
