import 'package:flutter/material.dart';
import 'package:q_ours/extensions/hex_color.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape_maker.dart';
import 'package:q_ours/widgets/navigation_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:q_ours/widgets/title_text.dart';
import 'categories/categories.dart';

class LandingPage extends StatelessWidget {
  AnimationController landingController;

  getController(AnimationController animationController) {
    this.landingController = animationController;
  }

  showShapeMakerCallback() {
    landingController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            TitleText('Create Code'),
            Categories(this.showShapeMakerCallback),
            FadeInUpBig(
              manualTrigger: true,
              controller: (controller) {
                getController(controller);
              },
              child: ShapeMaker(),
            ),
          ],
        ),
      ),
    );
  }
}