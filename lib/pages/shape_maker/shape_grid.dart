import 'package:flutter/material.dart';

class ShapeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: 1000,
      height: 400,
      child: Card(
        color: Colors.white.withOpacity(.6),
        elevation: 2,
      ),
    );
  }
}
