import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:q_ours/router.dart';
import 'package:q_ours/services/auth_service.dart';
import 'package:q_ours/services/locator.dart';
import 'package:q_ours/services/navigation_service.dart';
import '../extensions/link_hover.dart';

class NavigationBar extends StatefulWidget {
  static int index = 0;
  NavigationBar({Key key}) : super(key: key);
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
    updateNav(int i) {
      setState(() {
        NavigationBar.index = i;
      });
    }
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
                _NavItem(1, 'About', AboutRoute, updateNav),
                _NavItem(0, 'Create Code', HomeRoute, updateNav),
                (!authenticated)
                    ? _NavItem(2, 'Sign in/up', AuthRoute, updateNav)
                    : LoggedInItem(),
              ],
            )
          ],
        ));
  }
}

class _NavItem extends StatefulWidget {
  int index;
  String navItemText, route;
  Function(int) callback;

  _NavItem(this.index, this.navItemText, this.route, this.callback);

  @override
  __NavItemState createState() => __NavItemState();
}

class __NavItemState extends State<_NavItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
          onTap: () {
            widget.callback(widget.index);
            locator<NavigationService>().navigateTo(widget.route);
          },
          child: Text(
            widget.navItemText,
            style: TextStyle(
                color: NavigationBar.index == widget.index
                    ? Colors.red
                    : Colors.white,
                fontSize: 26),
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
