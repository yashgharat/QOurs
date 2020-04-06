import 'package:flutter/material.dart';
import 'package:gradient_input_border/gradient_input_border.dart';


class StyledFormField extends StatefulWidget {
  double width;
  String hintText;
  TextEditingController textController;

  StyledFormField(this.width, this.hintText, this.textController);
  @override
  _StyledFormFieldState createState() => _StyledFormFieldState();
}

class _StyledFormFieldState extends State<StyledFormField> {
  bool selected = false;
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.deepPurpleAccent[100],
            blurRadius:
                selected ? 8.0 : 0.0, // has the effect of softening the shadow
            spreadRadius:
                selected ? 8.0 : 0.0, // has the effect of extending the shadow
          )
        ], borderRadius: BorderRadius.circular(20.0), color: Colors.black),
        width: widget.width,
        height: 35,
        child: TextField(
          controller: widget.textController,
          focusNode: _focus,
          decoration: InputDecoration(
            filled: true,
            hintText: widget.hintText,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            enabledBorder: GradientOutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              unfocusedGradient: LinearGradient(
                  colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
              borderSide: BorderSide(width: 4),
              focusedGradient: null,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 2,
              ),
            ),
          ),
        ));
  }
}
