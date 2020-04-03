import 'package:flutter/material.dart';
import 'package:gradient_input_border/gradient_input_border.dart';
import '../../widgets/landing_page_divider.dart';
import 'package:animate_do/animate_do.dart';

class EnterURL extends StatefulWidget {
  static AnimationController animationController;
  Function(AnimationController) callback;

  EnterURL(this.callback);

  @override
  _EnterURLState createState() => _EnterURLState();
}

class _EnterURLState extends State<EnterURL> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FadeInUpBig(
      manualTrigger: true,
      controller: (controller) {
        controller.stop();
        print("here");
        widget.callback(controller);
      },
      child: Column(
        children: <Widget>[FabDivider('Enter URL'), StyledFormField()],
      ),
    ));
  }
}

class StyledFormField extends StatefulWidget {
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
        width: 650,
        height: 35,
        child: TextField(
          focusNode: _focus,
          decoration: InputDecoration(
            filled: true,
            hintText: "Enter URL",
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
