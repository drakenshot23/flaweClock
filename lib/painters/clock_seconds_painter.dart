
import 'package:flutter/material.dart';
import 'dart:math';

class ClockSecondsPainter extends CustomPainter {
  final double arcWidth;
  double completedPercent;

  ClockSecondsPainter({
    @required this.completedPercent,
    @required this.arcWidth}) : assert(completedPercent != null),
                                assert(arcWidth != null);
  @override
  void paint(Canvas canvas, Size size) {
    Rect gradientRect = Rect.fromCircle(center: (Offset.zero & size).center, radius: min(size.width/2, size.height/2));
    final Gradient gradient = LinearGradient(
      colors: <Color>[
        //Colors.green,
        Color.fromRGBO(106, 17, 203, 1),
        Color.fromRGBO(37, 117, 252, 1)
      ],
      stops: [
        0.5,
        0.9
      ],
    );
    final center = (Offset.zero & size).center;
    final arcPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcWidth
      ..shader = gradient.createShader(gradientRect);
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