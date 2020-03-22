import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            HexColor.fromHex('1A2A6C'),
            HexColor.fromHex('B21F1F'),
            HexColor.fromHex('FDBB2D')
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Hello World Uno',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Hello World Dos',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
