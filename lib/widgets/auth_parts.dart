import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';

class LoginField extends StatefulWidget {
  String buttonText;
  RichText helpText;
  bool isAccount;

  Function(String, String) action;

  LoginField(this.buttonText, this.helpText, this.action);
  @override
  LoginFieldState createState() => LoginFieldState();
}

class LoginFieldState extends State<LoginField> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController userControl = TextEditingController();
    TextEditingController passControl = TextEditingController();

    final emailField =
        UserTextField("Email Address", false, userControl, Icons.person);
    final passwordField =
        UserTextField("Password", true, passControl, Icons.lock);

    final loginButton = Container(
      width: 240.0,
      height: 54.0,
      child: RaisedButton(
        color: HexColor.fromHex('9965F4'),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () => widget.action(userControl.text, passControl.text),
        child: Text(
          widget.buttonText.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
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
        elevation: 6,
        color: Colors.white.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                emailField,
                passwordField,
                SizedBox(height: 10.0),
                loginButton,
                widget.helpText,
              ]
                  .map((input) => Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: input,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class UserTextField extends StatefulWidget {
  String hintText;
  bool obscureText, isPassword;
  IconData icon;

  TextEditingController textController;

  UserTextField(
      this.hintText, this.isPassword, this.textController, this.icon) {
    obscureText = isPassword;
  }
  @override
  _UserTextField createState() => _UserTextField();
}

class _UserTextField extends State<UserTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: widget.obscureText,
        controller: widget.textController,
        style: TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0, end: 30.0),
            child: Icon(widget.icon, color: HexColor.fromHex('D4BFF9')),
          ),
          suffixIcon: widget.isPassword
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(end: 20.0),
                  child: IconButton(
                    icon: Icon(
                      widget.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black87,
                    ),
                    onPressed: () => setState(
                        () => widget.obscureText = !widget.obscureText),
                  ),
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }
}
