import 'package:flutter/material.dart';
import './pages/landing_page/landing_page.dart';
import './pages/landing_page/categories/business_card.dart';
import './pages/landing_page/categories/enter_url.dart';
import './pages/landing_page/categories/social_media.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/businessCard':
        return MaterialPageRoute(builder: (_) => BusinessCard());
      case '/enterURL':
        return MaterialPageRoute(builder: (_) => EnterURL());
      case '/socialMedia':
        return MaterialPageRoute(builder: (_) => SocialMedia());
      
      //**** These are the routes for About, CreateCode, SignIn and SignUp *****/
      
      // case '/about':
      //   return MaterialPageRoute(builder: (_) => About());
      // case '/createCode':
      //   return MaterialPageRoute(builder: (_) => CreateCode());
      // case '/signIn':
      //   return MaterialPageRoute(builder: (_) => SignIn());
      // case '/signUp':
      //   return MaterialPageRoute(builder: (_) => SignUp());

      default:
        return MaterialPageRoute(builder: (_) => LandingPage());
    }
  }
}
