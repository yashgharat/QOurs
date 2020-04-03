import 'package:flutter/material.dart';
import 'package:q_ours/pages/landing_page/enter_url.dart';
import '../../widgets/landing_page_divider.dart';

class Categories extends StatefulWidget {
  fadeInUpBigCallback(bool selected, AnimationController animationController) {
    selected ? animationController.forward() : animationController.reverse();
  }

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool selected = true;
  Widget child;

  isSelectedCallback(
      bool selected, Widget child, AnimationController animationController) {
    this.selected = selected;
    this.child = child;
    print(child);
    print(animationController);
    widget.fadeInUpBigCallback(selected, animationController);
  }

  @override
  Widget build(BuildContext context) {
    List<_CategoryCard> categoryList = [
      _CategoryCard("URL", Icons.language, isSelectedCallback),
      _CategoryCard("Business", Icons.work, isSelectedCallback),
      _CategoryCard("Social Media", Icons.thumb_up, isSelectedCallback)
    ];

    return Container(
      child: Column(
        children: <Widget>[
          FabDivider('Category'),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: categoryList),
          Container()
        ],
      ),
    );
  }
}

class _CategoryCard extends StatefulWidget {
  String type;
  IconData iconData;
  AnimationController animationController;
  Widget child;
  Function(bool, Widget, AnimationController) callback;

  getControllerCallback(AnimationController controller) {
    this.animationController = controller;
  }

  _CategoryCard(this.type, this.iconData, this.callback) {
    child = EnterURL(getControllerCallback);
    print(this.animationController);
  }

  @override
  __CategoryCardState createState() => __CategoryCardState();
}

class __CategoryCardState extends State<_CategoryCard> {
  String type;
  IconData iconData;

  bool _selected = false, hover = false;
  Color _cardColor = Colors.white;

  Widget child;

  @override
  void initState() {
    type = widget.type;
    iconData = widget.iconData;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(horizontal: 45, vertical: 50),
      color: _selected ? Colors.deepPurpleAccent : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: 256,
        height: 256,
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            setState(() {
              _selected = !_selected;
              widget.callback(
                  _selected, widget.child, widget.animationController);
            });
          },
          onHover: (bool isHover) {
            setState(() {
              this.hover = isHover;
            });
          },
          hoverColor: (this._selected || this.hover)
              ? Colors.deepPurpleAccent
              : Colors.white,
          child: Icon(
            iconData,
            color: (this._selected || this.hover)
                ? Colors.white
                : Colors.deepPurpleAccent,
            size: 100.0,
          ),
        ),
      ),
    ));
  }
}
