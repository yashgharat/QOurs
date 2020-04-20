import 'package:flutter/material.dart';
import 'package:q_ours/pages/landing_page/categories/enter_url.dart';
import 'package:q_ours/pages/landing_page/categories/business_card.dart';
import 'package:q_ours/pages/landing_page/categories/social_media.dart';
import '../../../widgets/landing_page_divider.dart';
import 'package:animate_do/animate_do.dart';
import 'dart:async';

class Categories extends StatefulWidget {
  AnimationController previousAnimationController, animationController;
  Function(String) buttonCallback;
  Widget child;

  Categories(this.buttonCallback);

  getControllerCallback(controller) {
    this.animationController = controller;
  }

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int index, previousIndex = 0;
  fadeInUpBigcallback(bool selected, int selectedIndex) async {
    if (widget.previousAnimationController != null) {
      await widget.previousAnimationController.reverse();
      sleep(800, () => widget.animationController.forward());
    } else {
      widget.animationController.forward();
    }

    widget.previousAnimationController = widget.animationController;

    sleep(
        700,
        () => setState(() {
              this.index = selectedIndex;
            }));
  }

  @override
  Widget build(BuildContext context) {
    List<_CategoryCard> categoryList = [
      _CategoryCard("URL", Icons.language, fadeInUpBigcallback, 1, this.index),
      _CategoryCard("Business", Icons.business_center, fadeInUpBigcallback, 2,
          this.index),
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
              child: FadeInUpBig(
                  manualTrigger: true,
                  controller: (controller) {
                    widget.getControllerCallback(controller);
                  },
                  child: getChild(this.index)))
        ],
      ),
    );
  }

  Future sleep(int ms, Function() run) {
    return new Future.delayed(Duration(milliseconds: ms), run);
  }

  Widget getChild(int index) {
    if (index == 1) {
      return EnterURL(widget.buttonCallback);
    } else if (index == 2) {
      return BusinessCard();
    } else {
      return SocialMedia();
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
