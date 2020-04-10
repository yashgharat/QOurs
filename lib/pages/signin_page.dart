import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/signin_parts.dart';

class SignInPage extends StatefulWidget {
   @override
   SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
   String helpText = "Need an account? Sign up here.";
   String buttonText = "Login";
   @override
   Widget build(BuildContext context) {
      // Container with all login details
      final loginField = LoginField(buttonText, helpText);
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
         child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
               child: loginField,
            ),
         ),
      );
   }
}
