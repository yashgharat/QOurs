import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      color: Colors.black,
      child: Row(
        children: <Widget>[
          Text('QOurs', style: TextStyle(color: Colors.white, fontSize: 30,))
        ],
      )
    );
  }
}