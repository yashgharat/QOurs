import 'package:flutter/material.dart';
import 'package:q_ours/routes.dart';
import 'package:q_ours/widgets/navigation_bar.dart';
import './pages/landing_page/landing_page.dart';
import 'package:q_ours/extensions/hex_color.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "QOurs: A Code Generator", 
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: Scaffold(body: LandingPage(),),
    );
  }
}
