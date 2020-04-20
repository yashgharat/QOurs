import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:q_ours/router.dart';
import 'package:q_ours/services/auth_service.dart';
import 'package:q_ours/services/locator.dart';
import 'package:q_ours/services/navigation_service.dart';
import '../extensions/link_hover.dart';

class NavigationBar extends StatefulWidget {
  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  bool authenticated = false;
  changeNav(bool auth) {
    setState(() => authenticated = auth);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user != null && user.email != '') {
        print('logged in');
      } else {
        //needs to be authenticated
      }
    });
    return Container(
        height: 64,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('QOurs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                )),
            Row(
              children: <Widget>[
                _NavItem('About', AboutRoute),
                _NavItem('Create Code', HomeRoute),
                (!authenticated)
                    ? _NavItem('Sign in/up', AuthRoute)
                    : LoggedInItem(),
              ],
            )
          ],
        ));
  }
}

class _NavItem extends StatefulWidget {
  String navItemText, route;

  _NavItem(this.navItemText, this.route);

  @override
  __NavItemState createState() => __NavItemState();
}

class __NavItemState extends State<_NavItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
          onTap: () => locator<NavigationService>().navigateTo(widget.route),
          child: Text(
            widget.navItemText,
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
        ));
  }
}

class LoggedInItem extends StatefulWidget {
  @override
  _LoggedInItemState createState() => _LoggedInItemState();
}

class _LoggedInItemState extends State<LoggedInItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => AuthService().signOut(),
            child: Text(
              'Sign out',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 36,
              )),
        ],
      ),
    );
  }
}
