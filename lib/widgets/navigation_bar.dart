import 'package:flutter/material.dart';
import '../extensions/link_hover.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                _NavItem('About', '/about'),
                _NavItem('Create Code', '/'),
                _NavItem('Sign in/up', '/authentication')
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
          onTap: () => Navigator.of(context).pushNamed(widget.route),
          child: Text(
            widget.navItemText,
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
        ));
  }
}
