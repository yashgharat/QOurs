import 'package:flutter/material.dart';
import '../../../widgets/landing_page_divider.dart';
import '../../../widgets/styled_form_field.dart';
import 'package:animate_do/animate_do.dart';

class BusinessCard extends StatefulWidget {
  AnimationController animationController;
  Function(AnimationController) callback;

  BusinessCard(this.callback);

  @override
  _BusinessCardState createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    List<StyledFormField> inputList = [
      StyledFormField(375, 'Full Name'),
      StyledFormField(375, 'Address'),
      StyledFormField(375, 'Phone Number'),
      StyledFormField(375, 'Company Name'),
      StyledFormField(375, 'Email Address'),
      StyledFormField(375, 'Position title')
    ];

    return FadeInUpBig(
      manualTrigger: true,
      controller: (controller) {
        controller.stop();
        widget.callback(controller);
      },
      child: Column(
        children: <Widget>[
          FabDivider("Enter Info"),
          StyledFormField(375, "Name")
        ],
      ),
    );
  }
}
