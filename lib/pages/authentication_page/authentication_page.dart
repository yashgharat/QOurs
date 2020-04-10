import 'package:flutter/material.dart';
import 'package:q_ours/extensions/hex_color.dart';
import 'package:q_ours/widgets/signin_parts.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUp();
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

  @override
  Widget build(BuildContext context) {
    final loginField = LoginField(widget.buttonText, widget.helpText, login);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            HexColor.fromHex('1A2A6C'),
            HexColor.fromHex('B21F1F'),
            HexColor.fromHex('FDBB2D')
          ])),
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

  @override
  Widget build(BuildContext context) {
    final loginField = LoginField(widget.buttonText, widget.helpText, signup);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            HexColor.fromHex('1A2A6C'),
            HexColor.fromHex('B21F1F'),
            HexColor.fromHex('FDBB2D')
          ])),
      child: Center(
        child: loginField,
      ),
    );
  }
}
