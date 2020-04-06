import 'package:flutter/material.dart';
import 'package:q_ours/widgets/material_parts.dart';
import 'package:q_ours/widgets/landing_page_divider.dart';
import 'package:q_ours/widgets/styled_form_field.dart';

class EnterURL extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FabDivider('Enter URL'),
        StyledFormField(650, 'Enter URL', textController),
        QOursSubmitLinkButton('Submit', () => print(textController.text))
      ],
    );
  }
}
