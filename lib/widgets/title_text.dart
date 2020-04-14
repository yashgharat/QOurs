import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  String title;
  TitleText(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 75, bottom: 60),
        child: Text(title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w300)));
  }
}
