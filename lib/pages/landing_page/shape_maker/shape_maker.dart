import 'package:flutter/material.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape_gallery.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape_grid.dart';

import 'package:q_ours/widgets/landing_page_divider.dart';
import 'package:q_ours/widgets/material_parts.dart';

class ShapeMaker extends StatefulWidget {
  @override
  _ShapeMakerState createState() => _ShapeMakerState();
}

class _ShapeMakerState extends State<ShapeMaker> {
  List<Shape> currentShapes = [];

  addShape(String shapeName) {
    setState(() {
        currentShapes.add(Shape(shapeName));
    });
  }

  deleteShape() {
    setState(() {
      if(currentShapes.length > 0)
      currentShapes.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FabDivider('Shape Maker'),
        ShapeGrid(currentShapes),
        ShapeGallery(addShape, deleteShape),
        QOursSubmitLinkButton('done', () => {})
      ],
    );
  }
}