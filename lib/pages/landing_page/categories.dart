import 'package:flutter/material.dart';
import '../../widgets/landing_page_divider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
          FabDivider('Category'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            _CategoryCard(),
            _CategoryCard(),
            _CategoryCard()
          ],)
      ],),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(horizontal: 45, vertical: 50),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: 256,
          height: 256,
        ),),
    );
  }
}