import 'package:flutter/material.dart';
import '../../widgets/landing_page_divider.dart';

class Categories extends StatefulWidget {
  Function(bool) fadeinUpBigCallback;

  Categories(this.fadeinUpBigCallback);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    List<_CategoryCard> categoryList = [
      _CategoryCard("URL", Icons.language, widget.fadeinUpBigCallback),
      _CategoryCard("Business", Icons.work, widget.fadeinUpBigCallback),
      _CategoryCard("Social Media", Icons.thumb_up, widget.fadeinUpBigCallback)
    ];

    return Container(
      child: Column(
        children: <Widget>[
          FabDivider('Category'),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: categoryList),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatefulWidget {
  String type;
  IconData iconData;
  Function(bool) fadeinUpBigCallback;

  _CategoryCard(this.type, this.iconData, this.fadeinUpBigCallback) {}

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
                widget.fadeinUpBigCallback(_selected);
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
