import 'package:flutter/material.dart';

class ShapeGallery extends StatelessWidget {
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
      ),
    );
  }
}
