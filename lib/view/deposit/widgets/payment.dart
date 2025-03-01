// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//
// class QRCodeScreen extends StatefulWidget {
//   String url;
//   QRCodeScreen({super.key, required this.url});
//
//   @override
//   _QRCodeScreenState createState() => _QRCodeScreenState();
// }
//
// class _QRCodeScreenState extends State<QRCodeScreen> {
//   bool _isLoading = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Code'),
//       ),
//       body: Stack(
//         children: <Widget>[
//           InAppWebView(
//             initialUrlRequest: URLRequest(
//               url: Uri.parse(widget.url),
//             ),
//             onLoadStop: (controller, url) async {
//               setState(() {
//                 _isLoading = false;
//               });
//             },
//             onLoadError: (controller, url, code, message) {
//               if (kDebugMode) {
//                 print('WebView error: $message');
//               }
//               setState(() {
//                 _isLoading = false;
//               });
//             },
//           ),
//           _isLoading
//               ? const Center(
//             child: CircularProgressIndicator(),
//           )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QRCodeScreen extends StatefulWidget {
  final String url;

  const QRCodeScreen({super.key, required this.url});

  @override
  QRCodeScreenState createState() => QRCodeScreenState();
}

class QRCodeScreenState extends State<QRCodeScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const GradientAppBar(
            leading: AppBackBtn(),
            title: TextWidget(title: 'Pay', fontSize: 25, color: Colors.white),
            gradient: AppColors.appBarGradient),
        body: Column(
          children: <Widget>[
            if (_isLoading)
              Container(
                height: height,
                width: width,
                color: Colors.white,
                child: const Center(child: CircularProgressIndicator()),
              ),
            Expanded(
              child: WebView(
                backgroundColor: Colors.transparent,
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  webViewController.clearCache();
                  final cookieManager = CookieManager();
                  cookieManager.clearCookies();
                },
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.startsWith('upi://')) {
                    launch(request.url);
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  setState(() {
                    _isLoading = true;
                  });
                },
                onPageFinished: (String url) {
                  setState(() {
                    _isLoading = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
