import 'package:flutter/material.dart';
import 'package:q_ours/pages/view_container.dart';
import 'package:q_ours/router.dart';
import 'package:q_ours/services/auth_service.dart';
import 'package:q_ours/services/locator.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QOurs: A Code Generator",
      home: ViewContainer()
    );
  }
}
