import 'package:flutter/material.dart';
import 'package:q_ours/widgets/navigation_bar.dart';
import './pages/landing_page/landing_page.dart';
import 'package:q_ours/extensions/hex_color.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "QOurs: A Code Generator",
        home: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            HexColor.fromHex('1A2A6C'),
            HexColor.fromHex('B21F1F'),
            HexColor.fromHex('FDBB2D')
          ])),
          child: Column(
            children: <Widget>[NavigationBar(), LandingPage()],
          ),
        ));
  }
}
