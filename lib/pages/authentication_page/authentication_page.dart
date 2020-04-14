import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:q_ours/extensions/hex_color.dart';
import 'package:q_ours/widgets/auth_parts.dart';
import 'package:q_ours/widgets/title_text.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  String buttonText;

  action(String username, String password) {}

  switchType(bool isAccount) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ListView(
        children: <Widget>[
          TitleText('Sign in/up'),
          AnimatedContainer(duration: Duration(seconds: 1), child: SignUp())
        ],
      )),
    );
  }
}

class SignIn extends StatefulWidget {
  String helpText = "Need an account? Sign up here.";
  String buttonText = "Login";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  login(String username, String password) {
    print("do login");
  }

  callback() {
    print('callback');
  }

  @override
  Widget build(BuildContext context) {
    RichText text = RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Need an account? '),
      TextSpan(
          text: 'Sign up here.',
          style: TextStyle(color: HexColor.fromHex('EB3505')),
          recognizer: TapGestureRecognizer()..onTap = callback)
    ]));

    final loginField = LoginField(widget.buttonText, text, login);
    return Container(
      color: Colors.transparent,
      child: Center(
        child: loginField,
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  String helpText = "Already have an account? Login here.";
  String buttonText = "Register";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  signup(String username, String password) {
    print("do signup");
  }

  callback() {
    print('callback');
  }

  @override
  Widget build(BuildContext context) {
    RichText text = RichText(
        text: TextSpan(style:TextStyle(color: Colors.black), children: <TextSpan>[
      TextSpan(text: 'Already have an account? '),
      TextSpan(
          text: 'Login here.',
          style: TextStyle(color: HexColor.fromHex('EB3505')),
          recognizer: TapGestureRecognizer()..onTap = callback)
    ]));

    final loginField = LoginField(widget.buttonText, text, signup);
    return Container(
      child: Center(
        child: loginField,
      ),
    );
  }
}
