import 'package:flutter/material.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape_gallery.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape_grid.dart';

import 'package:q_ours/widgets/landing_page_divider.dart';

class ShapeMaker extends StatefulWidget {
  @override
  _ShapeMakerState createState() => _ShapeMakerState();
}

class _ShapeMakerState extends State<ShapeMaker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         FabDivider('Shape Maker'),
         ShapeGrid(),
         ShapeGallery(),
      ],
    );
  }
}