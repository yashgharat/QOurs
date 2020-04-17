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

  handleAuth(context) {
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user.email != '') {
        //logged in
        isLoggedIn = true;
        NavigationBar.of(context).changeNav(true);
        return ViewContainer();
      } else {
        //needs to be authenticated
        isLoggedIn = false;
        NavigationBar.of(context).changeNav(false);
        return ViewContainer();
      }
    });
  }

  signOut() => FirebaseAuth.instance.signOut();

  signIn(email, password) async {
    _currentUser = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password))
        .user;
  }

  register(email, password) async {
    _currentUser = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .user;

    if (!_currentUser.isEmailVerified)
      await _currentUser.sendEmailVerification();
  }
}
