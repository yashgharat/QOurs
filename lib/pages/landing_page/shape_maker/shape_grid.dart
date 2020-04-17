import 'dart:math';

import 'package:flutter/material.dart';
import 'package:q_ours/pages/landing_page/shape_maker/shape.dart';

class ShapeGrid extends StatefulWidget {
  List<Shape> currentShapes = [];

  ShapeGrid(this.currentShapes);

  @override
  _ShapeGridState createState() => _ShapeGridState();
}

class _ShapeGridState extends State<ShapeGrid> {
  int amount = 9;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 400,
      width: 1000,
      child: Card(
          color: Colors.white.withOpacity(.6),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Wrap(children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child: GridView.count(
                crossAxisCount: sqrt(amount).floor(),
                children: List.generate(amount, (index) {
                  if (widget.currentShapes.length > 9)
                    setState(() => amount = 16);
                  else
                    setState(() => amount = 9);

                  if (index < widget.currentShapes.length)
                    return GridPiece(widget.currentShapes[index]);
                  else
                    return Empty();
                }),
              ),
            ),
          ]))),
    );
  }
}

class GridPiece extends StatefulWidget {
  Shape shape;

  GridPiece(this.shape);

  @override
  _GridPieceState createState() => _GridPieceState();
}

class _GridPieceState extends State<GridPiece> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: widget.shape,
    );
  }
}

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
    );
  }
}
