import 'package:flutter/material.dart';
import '../../../widgets/landing_page_divider.dart';
import '../../../widgets/styled_form_field.dart';
import '../../../extensions/hex_color.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<StyledFormField> inputList = [
      StyledFormField(850, 'Enter URL'),
      StyledFormField(850, 'Enter URL'),
      StyledFormField(850, 'Enter URL'),
    ];
    return Column(
      children: <Widget>[
        FabDivider("Enter Info"),
        Column(
          children: inputList
              .map((input) => Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: input,
                  ))
              .toList(),
        ),
        RaisedButton(
            color: HexColor.fromHex('B794F6'),
            child: Text(
              'Submit'.toUpperCase(),
              style: TextStyle(letterSpacing: 1.5, fontSize: 14),
            ),
            onPressed: () => print("here")),
      ],
    );
  }
}
