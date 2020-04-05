import 'package:flutter/material.dart';
import '../../../widgets/landing_page_divider.dart';
import '../../../widgets/styled_form_field.dart';

class EnterURL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FabDivider('Enter URL'),
        StyledFormField(650, 'Enter URL')
      ],
    );
  }
}
