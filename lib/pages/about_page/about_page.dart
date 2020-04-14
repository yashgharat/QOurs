import 'package:flutter/material.dart';
import 'package:q_ours/widgets/title_text.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            TitleText('About'),

          ],
        ),
      ),
    );
  }
}
