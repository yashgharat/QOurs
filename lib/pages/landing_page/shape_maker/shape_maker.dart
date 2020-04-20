import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape_gallery.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape_grid.dart';

import 'package:q_ours/widgets/landing_page_divider.dart';

class ShapeMaker extends StatefulWidget {
  static List<Shape> currentShapes = [];

  ShapeMaker({Key key}) : super(key: key);

  @override
  ShapeMakerState createState() => ShapeMakerState();
}

class ShapeMakerState extends State<ShapeMaker> {
  addShape(String shapeName, int shapeEdges) {
    setState(() {
      ShapeMaker.currentShapes.add(Shape(shapeName, shapeEdges));
    });
  }

  deleteShape(bool flag) {
    setState(() {
      if (ShapeMaker.currentShapes.length > 0)
        (!flag) ? ShapeMaker.currentShapes.removeLast() : ShapeMaker.currentShapes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FabDivider('Shape Maker'),
        ShapeGrid(ShapeMaker.currentShapes),
        ShapeGallery(addShape, deleteShape),
      ],
    );
  }
}
