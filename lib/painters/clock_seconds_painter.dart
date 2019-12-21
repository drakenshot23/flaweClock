
import 'package:flutter/material.dart';
import 'dart:math';

class ClockSecondsPainter extends CustomPainter {
  final Color color;
  final double arcWidth;
  double completedPercent;

  ClockSecondsPainter({
    @required this.color,
    @required this.completedPercent,
    @required this.arcWidth}): assert(color != null),
                          assert(completedPercent != null),
                          assert(arcWidth != null);
  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final arcPaint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcWidth;
    double arcRadius  = min(size.width/2 - 12, size.height/2 - 12);
    double angle = 2 * pi * (completedPercent / 100);
    Rect rect = Rect.fromCircle(center: center, radius: arcRadius);
    canvas.drawArc(rect, -pi / 2, angle, false, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}