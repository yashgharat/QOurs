import 'package:flutter/material.dart';
import './pages/landing_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QOurs: A Code Generator",
      home: LandingPage(),
    );
  }
}