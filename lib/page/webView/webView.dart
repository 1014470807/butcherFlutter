import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebviewPage extends StatefulWidget {
  final String url;
  final String title;
  WebviewPage(this.url, this.title,{Key key}) : super(key: key);

  @override
  _WebviewPageState createState() => _WebviewPageState(url: this.url, title: this.title);
}

class _WebviewPageState extends State<WebviewPage> {
  String url;
  String title;
  _WebviewPageState({this.url,this.title}):super();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: WebviewScaffold(
        url: url,
      ),
    );
  }
}
