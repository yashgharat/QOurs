import 'package:flutter/material.dart';

class Shape extends StatelessWidget {
  String shapeName;

  Shape(this.shapeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/shapes/${shapeName}.png'))),
    );
  }
}
