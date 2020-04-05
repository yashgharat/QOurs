import 'package:flutter/material.dart';
import '../../../widgets/landing_page_divider.dart';
import '../../../widgets/styled_form_field.dart';
import 'package:animate_do/animate_do.dart';

class BusinessCard extends StatefulWidget {
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

    return Column(
      children: <Widget>[
        FabDivider("Enter Info"),
        Container(
          color: Colors.red,
            width: 500,
            height: 1000,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: inputList,
            ))
      ],
    );
  }
}
