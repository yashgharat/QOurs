import 'package:flutter/material.dart';
import 'package:q_ours/pages/about_page/about_page.dart';
import 'package:q_ours/pages/authentication_page/authentication_page.dart';
import 'package:q_ours/pages/landing_page/landing_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPage());
      //**** These are the routes for About, CreateCode, SignIn and SignUp *****/
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutPage());
      case '/authentication':
        return MaterialPageRoute(builder: (_) => AuthenticationPage());

      default:
        return MaterialPageRoute(builder: (_) => LandingPage());
    }
  }
}
