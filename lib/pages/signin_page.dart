import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/signin_parts.dart';

class SignInPage extends StatefulWidget {
   @override
   SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
   // Username icon
   Icon userIcon = Icon(
       Icons.person,
       size: 48.0,
       color: HexColor.fromHex('D4BFF9')); // myIcon is a 48px-wide widget.

   // Password icon
   Icon passIcon = Icon(
       Icons.lock,
       size: 48.0,
       color: HexColor.fromHex('D4BFF9')); // myIcon is a 48px-wide widget.

   TextEditingController userControl;
   TextEditingController passControl;

   @override
   Widget build(BuildContext context) {
      final emailField = UserTextField("Email Address", false, userControl, userIcon, false);

      final passwordField = UserTextField("Password", true, passControl, passIcon, true);

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
            color: Colors.white.withOpacity(0.4),
            borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
//            boxShadow: [
//               new BoxShadow(
//                  color: Colors.black,
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
