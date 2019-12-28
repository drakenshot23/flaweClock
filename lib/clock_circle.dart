import 'package:flutter/material.dart';
import 'painters/clock_circle_painter.dart';

class ClockCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: ClockCirclePainter(
            color: Colors.grey[900]
        ),
      ),
    );
  }
}