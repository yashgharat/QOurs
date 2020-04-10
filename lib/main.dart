import 'package:flutter/material.dart';
import 'package:q_ours/pages/authentication_page/authentication_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QOurs: A Code Generator",
      home: Scaffold(body: AuthenticationPage()),
    );
  }
}
