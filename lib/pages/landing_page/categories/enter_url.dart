import 'package:flutter/material.dart';
import '../../../widgets/landing_page_divider.dart';
import '../../../widgets/styled_form_field.dart';
import 'package:animate_do/animate_do.dart';

class EnterURL extends StatefulWidget {
  AnimationController animationController;
  Function(AnimationController) callback;

  EnterURL(this.callback);

  @override
  _EnterURLState createState() => _EnterURLState();
}

class _EnterURLState extends State<EnterURL> {
  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      manualTrigger: true,
      controller: (controller) {
        controller.stop();
        widget.callback(controller);
      },
      child: Column(
        children: <Widget>[FabDivider('Enter URL'), StyledFormField(650, 'Enter URL')],
      ),
    );
  }
}