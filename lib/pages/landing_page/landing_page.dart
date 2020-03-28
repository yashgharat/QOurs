import 'package:flutter/material.dart';
import '../../extensions/hex_color.dart';
import '../../widgets/landing_page_divider.dart';
import '../../widgets/navigation_bar.dart';
import './categories.dart';
import './enter_url.dart';

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
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 100, bottom: 60),
                        child: Text('Create Code',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w300))),
                    Categories(),
                    Container(alignment: Alignment.center, child: EnterURL()),
                    Container(height: 150,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget objectBuilder() {
  
}