import 'package:flutter/material.dart';

class ShadowCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.orientation == Orientation.portrait ? (mediaQueryData.size.width / (5/3)) - 34 : mediaQueryData.size.width - 50;
    var height = mediaQueryData.orientation == Orientation.portrait ? (mediaQueryData.size.height / (5/3)) - 34 : mediaQueryData.size.height - 50;

    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: Colors.black87,
                  offset: Offset.zero,
                  blurRadius: 12,
                  spreadRadius: 0.5
              )
            ],
            shape: BoxShape.circle
        ),
      ),
    );
  }
}