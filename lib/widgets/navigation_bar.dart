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
                //
                //*** I was wondering if could add the onTap() here when we are creating these links but I am not quite sure */
                //  
                //  new GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).pushNamed('/about');
                //   },
                //    _NavItem('About),
                //   );
                //
                _NavItem('About'),
                _NavItem('Create Code'),
                _NavItem('Sign in/up')
              ],
            )
          ],
        ));
  }
}

class _NavItem extends StatelessWidget {
  @override
  String navItemText;
  _NavItem(this.navItemText);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
      navItemText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 26),
    ));
  }
}
