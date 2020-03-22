import 'package:flutter/material.dart';
import '../../widgets/landing_page_divider.dart';

class EnterURL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[FabDivider('Enter URL'), StyledFormField()],
      ),
    );
  }
}

class StyledFormField extends StatefulWidget {
  @override
  _StyledFormFieldState createState() => _StyledFormFieldState();
}

class _StyledFormFieldState extends State<StyledFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: 650,
          height: 35,
        ),
      ),
    );
  }
}
