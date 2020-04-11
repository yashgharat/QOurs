import 'package:flutter/material.dart';
import 'package:q_ours/extensions/hex_color.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape_maker.dart';
import 'package:q_ours/widgets/navigation_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'categories/categories.dart';

class LandingPage extends StatelessWidget {
  AnimationController animationController;

  showShapeMakerCallback() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 75, bottom: 60),
                child: Text('Create Code',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w300))),
            Categories(this.showShapeMakerCallback),
            FadeInUpBig(
              manualTrigger: true,
              controller: (controller) {
                this.animationController = controller;
              },
              child: ShapeMaker(),
            ),
          ],
        ),
      ),
    );
  }
}