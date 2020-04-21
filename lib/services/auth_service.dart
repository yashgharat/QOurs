import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:q_ours/pages/view_container.dart';
import 'package:q_ours/router.dart';
import 'package:q_ours/services/locator.dart';
import 'package:q_ours/services/navigation_service.dart';
import 'package:q_ours/widgets/navigation_bar.dart';

FirebaseUser _currentUser;

class AuthService {
  static bool isLoggedIn = false;

  handleAuth() {
    if (_currentUser != null && _currentUser.email != '') {
      isLoggedIn = true;
      locator<NavigationService>().navigateTo(HomeRoute);
      ViewContainer.navBarKey.currentState.changeNav(true);
    } else {
      isLoggedIn = false;
      ViewContainer.navBarKey.currentState.changeNav(false);
      locator<NavigationService>().navigateTo(AuthRoute);
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    _currentUser = null;
    handleAuth();
  }

  signIn(email, password) async {
    _currentUser = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .catchError((e) => print(e)))
        .user;
    handleAuth();
  }

  register(email, password) async {
    _currentUser = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .user;

    if (!_currentUser.isEmailVerified)
      await _currentUser.sendEmailVerification();
  }
}
