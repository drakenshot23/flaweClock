import 'package:flawe_clock/clock_container.dart';
import 'package:flutter/material.dart';

class ShadowCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: ClockContainer.mediaQueryData.orientation == Orientation.portrait ? (ClockContainer.mediaQueryData.size.width / (5/3)) - 35 : ClockContainer.mediaQueryData.size.width - 55,
        height: ClockContainer.mediaQueryData.orientation == Orientation.portrait ? (ClockContainer.mediaQueryData.size.height / (5/3)) - 35 : ClockContainer.mediaQueryData.size.height - 55,
        decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset.zero,
                  blurRadius: 10,
                  spreadRadius: 3
              )
            ],
            shape: BoxShape.circle
        ),
      ),
    );
  }
}