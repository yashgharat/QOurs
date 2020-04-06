import 'package:flutter/material.dart';
import '../../../widgets/landing_page_divider.dart';
import '../../../widgets/styled_form_field.dart';

class BusinessCard extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<StyledFormField> inputList = [
      StyledFormField(375, 'Full Name', this.textController),
      StyledFormField(375, 'Address', this.textController),
      StyledFormField(375, 'Phone Number', this.textController),
      StyledFormField(375, 'Company Name', this.textController),
      StyledFormField(375, 'Email Address', this.textController),
      StyledFormField(375, 'Position title', this.textController)
    ];

    return Column(
      children: <Widget>[
        FabDivider("Enter Info"),
        Container(
            width: 800,
            child: GridView.count(
              childAspectRatio: 375 / 35,
              shrinkWrap: true,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: inputList,
            ))
      ],
    );
  }
}
