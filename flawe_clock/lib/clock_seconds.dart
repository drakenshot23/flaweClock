import 'package:flutter/material.dart';
import 'painters/clock_seconds_painter.dart';

class ClockSeconds extends StatelessWidget {
  final double completedPercent;

  const ClockSeconds({@required this.completedPercent})
      : assert(completedPercent != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: ClockSecondsPainter(
            completedPercent: completedPercent, arcWidth: 10.0),
      ),
    );
  }
}
