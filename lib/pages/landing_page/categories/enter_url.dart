import 'package:flutter/material.dart';
import 'package:q_ours/extensions/hex_color.dart';
import 'package:q_ours/widgets/material_parts.dart';
import 'package:q_ours/widgets/landing_page_divider.dart';
import 'package:q_ours/widgets/styled_form_field.dart';

class EnterURL extends StatelessWidget {
  final textController = TextEditingController();
  
  Function(String) callback;

  EnterURL(this.callback);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FabDivider('Enter URL'),
        StyledFormField(650, 'Enter URL', textController),
        Container(
        width: 100,
        child: RaisedButton(
            color: HexColor.fromHex('B794F6'),
            child: Text(
              'Submit'.toUpperCase(),
              style: TextStyle(
                  color: Colors.black, letterSpacing: 1.5, fontSize: 14),
            ),
            onPressed: () => callback(textController.text)))
      ],
      // Implement onPressed() to makeRequest()
        //onPressed: makeRequest,
    );
  }
}
