import 'package:flutter/material.dart';
import 'package:q_ours/pages/view_container.dart';
import 'package:q_ours/routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "QOurs: A Code Generator", 
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: ViewContainer(),
    );
  }
}
