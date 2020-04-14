import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:q_ours/pages/about_page/about_page.dart';
import 'package:q_ours/pages/authentication_page/authentication_page.dart';
import 'package:q_ours/pages/landing_page/landing_page.dart';

const String HomeRoute = 'home';
const String AboutRoute = 'about';
const String AuthRoute = 'authentication';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
        return MaterialPageRoute(builder: (_) => LandingPage());
    case AboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
    case AuthRoute:
        return MaterialPageRoute(builder: (_) => AuthenticationPage());
    default:
        return MaterialPageRoute(builder: (_) => LandingPage());
  }
}
