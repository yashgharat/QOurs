import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';
import '../widgets/landing_page_divider.dart';
import '../widgets/navigation_bar.dart';

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
              NavigationBar(),
              Container(
                margin: EdgeInsets.only(top: 100, bottom: 60),
                child: Text('Create Code',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w300))),
              FabDivider('Category'),
              FabDivider('Enter Url'),
              FabDivider('Shape Maker'),
            ],
          ),
        ),
      ),
    );
  }
}
