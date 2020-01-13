import 'package:flutter/material.dart';
import 'dart:math';

class ClockCirclePainter extends CustomPainter {
  final Color color;

  const ClockCirclePainter({@required this.color}) : assert(color != null);

  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final circlePaint = Paint()..color = color;
    double circleRadius = min(size.width / 2 - 17, size.height / 2 - 17);
    canvas.drawCircle(center, circleRadius, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
