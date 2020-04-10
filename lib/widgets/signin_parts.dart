import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';
import 'package:condition/condition.dart';

import 'styled_form_field.dart';

class UserTextField extends StatefulWidget {
  String hintText;
  bool obscureText;
  bool isPassword;
  Icon icon;
  TextEditingController textController;

  UserTextField(this.hintText, this.obscureText, this.textController, this.icon,
      this.isPassword);
  @override
  _UserTextField createState() => _UserTextField();
}

class _UserTextField extends State<UserTextField> {
  Icon passIcon;
  TextStyle style = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 24,
    color: Colors.black87,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450.0,
      height: 72.0,
      child: TextFormField(
        obscureText: widget.obscureText,
        controller: widget.textController,
        style: style,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0, end: 30.0),
            child: widget.icon,
          ),
          suffixIcon: Conditioned.boolean(
            widget.isPassword == true,
            trueBuilder: () => Padding(
              padding: const EdgeInsetsDirectional.only(end: 20.0),
              child: IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility : Icons.visibility_off,
                  size: 32.0,
                  color: Colors.black87,
                ),
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
              ),
            ),
            falseBuilder: () => Container(
              width: 0,
              height: 0,
            ),
          ),
//                suffixIcon: Padding(
//                   padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
//                   child: Conditioned.boolean(widget.isPassword == true,
//                      trueBuilder: () => IconButton(
//                         icon: Icon(
//                            widget.obscureText ?
//                            Icons.visibility : Icons.visibility_off,
//                            size: 48.0,
//                            color: Colors.black87,
//                         ),
//                         onPressed: () {
//                            setState(() {
//                               widget.obscureText = !widget.obscureText;
//                            });
//                         },
//                      ),
//                      falseBuilder: () => Container(width: 0, height: 0,),
//                   ),
//                ),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }
}

class LoginField extends StatefulWidget {
  String buttonText;
  String helpText;

  Function(String, String) action;

  LoginField(this.buttonText, this.helpText, this.action);
  @override
  LoginFieldState createState() => LoginFieldState();
}

class LoginFieldState extends State<LoginField> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Icon userIcon = Icon(Icons.person,
        size: 48.0,
        color: HexColor.fromHex('D4BFF9')); // myIcon is a 48px-wide widget.

    // Password icon
    Icon passIcon = Icon(Icons.lock,
        size: 48.0,
        color: HexColor.fromHex('D4BFF9')); // myIcon is a 48px-wide widget.

    TextEditingController userControl = TextEditingController();
    TextEditingController passControl = TextEditingController();

    final emailField =
        UserTextField("Email Address", false, userControl, userIcon, false);
    final passwordField =
        UserTextField("Password", true, passControl, passIcon, true);
    final loginButton = Container(
      width: 320.0,
      height: 69.0,
        child: RaisedButton(
          color: HexColor.fromHex('9965F4'),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () => widget.action(userControl.text, passControl.text),
          child: Text(
            widget.buttonText.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 36,
              color: Colors.white,
              letterSpacing: 1.25,
            ),
          ),
        ),
    );
    return Container(
      width: 500.0,
      height: 500.0,
      child: Card(
        elevation: 5,
        color: Colors.white.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                emailField,
                SizedBox(height: 20.0),
                passwordField,
                SizedBox(height: 40.0),
                loginButton,
                SizedBox(height: 30.0),
                Text(
                  "Need an account? Sign up here.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
