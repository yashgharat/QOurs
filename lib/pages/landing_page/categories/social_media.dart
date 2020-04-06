import 'package:flutter/material.dart';
import '../../../widgets/landing_page_divider.dart';
import '../../../widgets/styled_form_field.dart';
import '../../../extensions/hex_color.dart';

class SocialMedia extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<StyledFormField> inputList = [
      StyledFormField(850, 'Enter URL', this.textController),
      StyledFormField(850, 'Enter URL', this.textController),
      StyledFormField(850, 'Enter URL', this.textController),
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
      ],
    );
  }
}
