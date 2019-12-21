import 'dart:async';

import 'package:flutter/material.dart';
import 'painters/clock_seconds_painter.dart';

class ClockSeconds extends StatefulWidget {
  @override
  _ClockSecondsState createState() => _ClockSecondsState();
}

class _ClockSecondsState extends State<ClockSeconds> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  double completedPercent;

  @override
  void initState() {
    super.initState();
    setState(() {
      completedPercent = _dateTime.second * 100 / 60;
      _updateSeconds();
    });
  }

  _updateSeconds() {
    setState(() {
      _dateTime = DateTime.now();

      completedPercent = _dateTime.second * 100 / 60;

      _timer = Timer(Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond), _updateSeconds);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: ClockSecondsPainter(
              color: Colors.blueAccent,
              completedPercent: completedPercent,
              arcWidth: 10.0
          ),
        ),
      ),
    );
  }
}