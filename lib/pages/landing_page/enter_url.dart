import 'package:flutter/material.dart';
import 'package:gradient_input_border/gradient_input_border.dart';
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
      width: 650,
      height: 35,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          hintText: "Enter URL",
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          enabledBorder: GradientOutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            focusedGradient: LinearGradient(colors: [Colors.red, Colors.blue]),
            unfocusedGradient: LinearGradient(colors: [Colors.yellow, Colors.green]),
            borderSide: BorderSide(width: 2),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(width: 2, ),
        ),
      ),
    ));
  }
}
