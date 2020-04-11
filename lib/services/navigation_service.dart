import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navKey.currentState.pushNamed(routeName);
  }

  goBack() {
    return navKey.currentState.pop();
  }
}
