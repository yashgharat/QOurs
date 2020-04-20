import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:q_ours/extensions/hex_color.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape_maker.dart';
import 'package:q_ours/widgets/material_parts.dart';
import 'package:q_ours/widgets/navigation_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:q_ours/widgets/title_text.dart';
import 'package:uuid/uuid.dart';
import 'categories/categories.dart';

class LandingPage extends StatelessWidget {
  AnimationController landingController;
  String submitUrl;

  GlobalKey<ShapeMakerState> shapeKey = GlobalKey();

  getController(AnimationController animationController) {
    this.landingController = animationController;
  }

  showShapeMakerCallback(String url) {
    this.submitUrl = url;
    landingController.forward();
  }

  createString() async {
    var generator = Uuid();
    var uuid = generator.v4();

    String resString;
    var buffer = StringBuffer();
    List shapes = ShapeMaker.currentShapes;

    buffer.write(shapes.length.toString());
    shapes.forEach((shape) => buffer.write(shape.numEdges.toString()));

    resString = buffer.toString();

    String url =
        "https://us-central1-poos-qours.cloudfunctions.net/app/api/store-binary";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"binary": "${resString}", "url": "${this.submitUrl}", "creator_uid": "${uuid}"}';

    Response response = await post(url, headers: headers, body: json);

    if (response.statusCode == 200)
      shapeKey.currentState.setState(() {
        ShapeMaker.currentShapes.clear();
      });
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
              child: Column(children: <Widget>[
                ShapeMaker(key: shapeKey,),
                QOursSubmitLinkButton('Submit', () => createString())
              ],)
            ),
          ],
        ),
      ),
    );
  }
}
