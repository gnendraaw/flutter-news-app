import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebDetailPage extends StatelessWidget {
  static const routeName = '/web_detail_page';

  final String url;

  const WebDetailPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
