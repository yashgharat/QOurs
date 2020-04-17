import 'package:flutter/material.dart';

class ShapeGallery extends StatelessWidget {
  Function(String) addShape;
  Function() deleteShape;

  ShapeGallery(this.addShape, this.deleteShape);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: 1000,
      height: 150,
      child: Card(
        color: Colors.white.withOpacity(.6),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(children: <Widget>[
          _ShapeContainer('circle', addShape),
          _ShapeContainer('triangle', addShape),
          _ShapeContainer('rectangle', addShape),
          _ShapeContainer('pentagon', addShape),
          _ShapeContainer('hexagon', addShape),
          _DeleteShapeButton(deleteShape),
        ]),
      ),
    );
  }
}

class _DeleteShapeButton extends StatelessWidget {
  Function() deleteShape;

  _DeleteShapeButton(this.deleteShape);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        width: 100,
        child: InkWell(
          onTap: () => deleteShape(),
          child: Icon(Icons.delete, size: 52,),
        ),
      ),
    );
  }
}

class _ShapeContainer extends StatelessWidget {
  String shapeName;
  Function(String) addShape;

  _ShapeContainer(this.shapeName, this.addShape);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('lib/assets/shapes/${shapeName}.png'),
      )),
      child: InkWell(
        onTap: () => addShape(shapeName),
      ),
    ));
  }
}