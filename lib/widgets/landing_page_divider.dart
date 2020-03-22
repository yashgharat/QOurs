import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';

class FabDivider extends StatelessWidget {
  String buttonText;

  FabDivider(this.buttonText);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
              width: 700,
              child: Divider(
                color: Colors.white,
                thickness: 2.0,
              )),
          Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: HexColor.fromHex('EB3505'),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  this.buttonText.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    letterSpacing: 1.25,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
