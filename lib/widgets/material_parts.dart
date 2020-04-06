import 'package:flutter/material.dart';
import 'package:q_ours/extensions/hex_color.dart';

class QOursSubmitLinkButton extends StatelessWidget {
  Function() run;
  String buttonText;
  QOursSubmitLinkButton(this.buttonText, this.run);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: RaisedButton(
            color: HexColor.fromHex('B794F6'),
            child: Text(
              buttonText.toUpperCase(),
              style: TextStyle(
                  color: Colors.black, letterSpacing: 1.5, fontSize: 14),
            ),
            onPressed: run));
  }
}
