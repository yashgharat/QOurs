import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';
import '../widgets/navigation_bar.dart';


class SignInPage extends StatefulWidget {
   @override
   SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
   // Add font
   // TextStyle style = TextStyle(fontFamily: '[font]', fontSize: #);
   @override
   Widget build(BuildContext context) {
      final emailField = Container(
         width: 450.0,
         height: 72.0,
         child: TextField(
            obscureText: false,
            // style: style,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Email Adress",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
         ),
      );
      final passwordField = Container(
         width: 450.0,
         height: 72.0,
         child: TextField(
             obscureText: true,
             // style: style,
             decoration: InputDecoration(
                 filled: true,
                 fillColor: Colors.white,
                 hintText: "Password",
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          ),
      );

      final loginButton = Container(
         width: 320.0,
         height: 69.0,
         child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(15.0),
            color: HexColor.fromHex('9965F4'),
            child: MaterialButton(
               minWidth: MediaQuery.of(context).size.width,
               onPressed: () {},
               child: Text("Login",
                  textAlign: TextAlign.center,
               ),
            ),
         ),
      );


      // Container with all login details
      final loginField = Container(
         width: 550.0,
         height: 500.0,
         decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
//            boxShadow: [
//               new BoxShadow(
//                  color: Colqors.black,
//                  blurRadius: 20.0,
//               )
//            ],
         ),
         child: Padding(
            padding: const EdgeInsets.all(70.0),
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
                  SizedBox(height: 40.0),
               ],
            ),
         ),
      );
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
