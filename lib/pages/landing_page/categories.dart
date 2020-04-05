import 'package:flutter/material.dart';
import 'package:q_ours/pages/landing_page/enter_url.dart';
import '../../widgets/landing_page_divider.dart';
import 'dart:async';

class Categories extends StatefulWidget {
  AnimationController previousAnimationController, animationController;
  Widget child;

  getControllerCallback(controller) {
    this.animationController = controller;
  }

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int index, previousIndex = 0;
  fadeInUpBigcallback(bool selected, int selectedIndex) {
    if (widget.previousAnimationController != null) {
      widget.previousAnimationController.reverse();
      Future.delayed(const Duration(seconds: 1),
          () => widget.animationController.forward());
    }
    else {widget.animationController.forward();}
    setState(() {
      this.index = selectedIndex;
          widget.previousAnimationController = widget.animationController;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<_CategoryCard> categoryList = [
      _CategoryCard("URL", Icons.language, fadeInUpBigcallback, 1, this.index),
      _CategoryCard("Business", Icons.work, fadeInUpBigcallback, 2, this.index),
      _CategoryCard(
          "Social Media", Icons.thumb_up, fadeInUpBigcallback, 3, this.index)
    ];

    return Container(
      child: Column(
        children: <Widget>[
          FabDivider('Category'),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: categoryList),
          Container(
            child: getChild(this.index),
          )
        ],
      ),
    );
  }

  Future sleep() {
    return new Future.delayed(const Duration(seconds: 1), () => "1");
  }

  Widget getChild(int index) {
    if (index == 1) {
      return EnterURL(widget.getControllerCallback, index);
    } else if (index == 2) {
      return EnterURL(widget.getControllerCallback, index);
    } else {
      return EnterURL(widget.getControllerCallback, index);
    }
  }
}

class _CategoryCard extends StatefulWidget {
  String type;
  IconData iconData;
  int index, selectedIndex;
  Function(bool, int) fadeinUpBigCallback;

  _CategoryCard(this.type, this.iconData, this.fadeinUpBigCallback, this.index,
      this.selectedIndex) {}

  @override
  __CategoryCardState createState() => __CategoryCardState();
}

class __CategoryCardState extends State<_CategoryCard> {
  String type;
  IconData iconData;

  bool _selected = false, hover = false;
  Color _cardColor = Colors.white;

  @override
  void initState() {
    type = widget.type;
    iconData = widget.iconData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _selected = (widget.index == widget.selectedIndex) ? true : false;
    });
    return Container(
      child: Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(horizontal: 45, vertical: 50),
        color: _selected ? Colors.deepPurpleAccent : Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: 256,
          height: 256,
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {
              setState(() {
                _selected = !_selected;
                widget.fadeinUpBigCallback(_selected, widget.index);
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
      ),
    );
  }
}
