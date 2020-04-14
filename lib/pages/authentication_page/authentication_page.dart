import 'package:flip_card/flip_card.dart';
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
  String leadIn, link;
  bool isAccount;

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  action(String username, String password) {
    if (isAccount) {
      print('login');
    } else {
      print('register');
    }
  }

  _AuthenticationPageState() {
    isAccount = true;
    buttonText = 'Login';
    leadIn = 'Need an Account? ';
    link = 'Sign up';
  }

  switchType() {
    cardKey.currentState.toggleCard();
  }

  @override
  Widget build(BuildContext context) {
    RichText loginText = RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Need an Account? ', style: TextStyle(color: Colors.black)),
      TextSpan(
          text: 'Sign up' ,
          style: TextStyle(color: HexColor.fromHex('EB3505')),
          recognizer: TapGestureRecognizer()..onTap = switchType)
    ]));

    RichText registerText = RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Already have an account? ', style: TextStyle(color: Colors.black)),
      TextSpan(
          text: 'Login',
          style: TextStyle(color: HexColor.fromHex('EB3505')),
          recognizer: TapGestureRecognizer()..onTap = switchType)
    ]));

    return Container(
        child: ListView(
      children: <Widget>[
        TitleText('Sign in/up'),
        FlipCard(
          key: cardKey,
          flipOnTouch: false,
          direction: FlipDirection.HORIZONTAL,
          speed: 1000,
          front: Center(child: LoginField('Login', loginText, action)),
          back: Center(child: LoginField('Register', registerText, action)),
        )
      ],
    ));
  }
}
