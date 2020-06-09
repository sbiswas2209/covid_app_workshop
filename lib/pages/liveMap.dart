import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class LiveMap extends StatelessWidget {
  static final String tag = 'live-map';
  static final String url = 'https://www.trackcorona.live/map';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Map',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: WebviewScaffold(url: url),
      ),
    );
  }
}